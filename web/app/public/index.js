var componentsMap = {};

function ProductsComponent(element) {
  var tbody = $('tbody', element).first();
  
  var addProduct = function(data) {
    var count = tbody.children().length;

    tbody.append('<tr>\
    <td>' + (count+1) + '</td>\
    <td>' + data.name + '</td>\
    <td>' + data.price + '</td>\
    </tr>');
  }

  var recieveProducts = function(list) {
    $.each(list, function(i, d) { addProduct(d) });
  }

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