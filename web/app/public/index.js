var componentsMap = {};

function ProductsComponent(element) {
  var form = $('form', element).first();
  var tbody = $('tbody', element).first();
  var rowsById = {};
  
  var addProduct = function(data) {
    var count = tbody.children().length;
    var deleteBtn = $('<button class="btn btn-danger">Delete</button>');
    deleteBtn.on('click', function() {
      deleteProduct(data.id);
    });

    var row = $('<tr>\
    <td>' + data.id + '</td>\
    <td>' + data.name + '</td>\
    <td>' + data.price + '</td>\
    </tr>');

    var rowOptions = $('<td></td>');
    rowOptions.append(deleteBtn);

    rowsById[data.id] = row;
    row.append(rowOptions);
    tbody.append(row);
  }

  var recieveProducts = function(list) {
    list.forEach(addProduct);
  }

  var deleteProduct = function(id) {
    $.ajax({
      url: '/api/products/' + id,
      type: 'DELETE',
      success: function(response, status, xhr) {
        if(status == 'success' && xhr.status == 204) {
          rowsById[id].remove();
          delete rowsById[id];
        }
      }
    });
  }

  var pushProduct = function(product) {
    $.ajax({
      url: '/api/products',
      type: 'POST',
      contentType: 'application/json',
      dataType: 'json',
      data: JSON.stringify(product),
      success: function(newProduct, status, xhr) {
        if(status == 'success' && xhr.status == 201) {          
          addProduct(newProduct);
        } else {
          console.log("Cannot add product: Failed to push the product");
        }
      }
    });
  }

  // Handle form submit
  form.submit(function(e) {
    e.preventDefault();
    var product = {};

    // serialize form data
    form.serializeArray().forEach(function(field) {
      product[field.name] = field.value;
    });

    pushProduct(product);
  });

  // init populate table with product data
  $.getJSON('/api/products', recieveProducts);
}

// register products component
componentsMap.products = ProductsComponent;

// initialize all registered components
$('[data-component]').forEach(function(component) {
  var name = component.getAttribute('data-component');
  var classDef = componentsMap[name];
  
  if(classDef != undefined) {
    new classDef(component);
  }
});