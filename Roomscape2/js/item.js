var itemList = new Array();

function Task(selector,quantity){
    this.selector = selector;
    this.quantity = quantity;
}

function addItem(){
    var quantityValue = document.getElementById("quantity").value;
    var selectorValue = document.getElementById("selector").value;
    var task = new Task(selectorValue, quantityValue);

	//no quantity input error message
	if(quantityValue == 0){
		alert("Must insert Quantity");
        return false;
	}
	
	itemList.push(task);
    display();
}
function selectItem(num){
    var checkBox = document.getElementById(num);
    var text = document.getElementById("d_" +num);
    if(checkBox.checked == true){
        text.style.color= "red";
    }
    else{
        text.style.color= "black";
    }
}

function removeSelectedItem(){
    var output_list = document.getElementsByClassName("task");
    
    for(var i=0; i < output_list.length;i++){
        var checkBox = document.getElementById(i);
        
        if(checkBox.checked == true){
            delete itemList[i];
        }
    }
    
    for(var i=0; i < itemList.length;i++){
    
        if(itemList[i]== undefined){
            itemList.splice(i,1);
        }
    }
    
    var output = document.getElementById("demo1");
    while(output.firstChild){
        output.removeChild(output.firstChild);
    }
    
    for(var i=0; i< itemList.length; i++) {
        var textNode = document.createTextNode("Task is to "+ itemList[i].selector + 
        " with a quantity of " + itemList[i].quantity);
        
        textNode.id = "t_" +i;
       
        var itemDiv = document.createElement("div");
        itemDiv.setAttribute("id", "d_" +i);
        itemDiv.setAttribute("class", "task");
        
        var input = document.createElement("input");
        input.type = "checkbox";
        input.setAttribute("id", i);
        input.setAttribute("onclick", "selectItem(" +i+ ")");
        itemDiv.appendChild(textNode);
        itemDiv.appendChild(input);
        output.appendChild(itemDiv);
        document.body.appendChild(output);
    }
}




function display() {
    var output = document.getElementById("demo1");
    
    for(var i=0; i< itemList.length; i++) {
        var textNode = document.createTextNode("Item: "+ itemList[i].selector + 
        " with a quantity of " + itemList[i].quantity);
        
        textNode.id = "t_" +i;
       
        var itemDiv = document.createElement("div");
        itemDiv.setAttribute("id", "d_" +i);
        itemDiv.setAttribute("class", "task");
        
        var input = document.createElement("input");
        input.type = "checkbox";
        input.setAttribute("id", i);
        input.setAttribute("onclick", "selectItem(" +i+ ")");
    }
    itemDiv.appendChild(textNode);
    itemDiv.appendChild(input);
    output.appendChild(itemDiv);
}




function rank() {
    var output = document.getElementById("demo1");
    while(output.firstChild){
        output.removeChild(output.firstChild);
    }
    itemList.sort(function(a,b){
        return a.quantity - b.quantity
    });
    
   for(var i=0; i< itemList.length; i++) {
        var textNode = document.createTextNode("Item: "+ itemList[i].selector + 
        " with a quantity of " + itemList[i].quantity);
        
        textNode.id = "t_" +i;
       
        var itemDiv = document.createElement("div");
        itemDiv.setAttribute("id", "d_" +i);
        itemDiv.setAttribute("class", "task");
        
        var input = document.createElement("input");
        input.type = "checkbox";
        input.setAttribute("id", i);
        input.setAttribute("onclick", "selectItem(" +i+ ")");
       
        itemDiv.appendChild(textNode);
        itemDiv.appendChild(input);
        output.appendChild(itemDiv);
        document.body.appendChild(output);
    }
}

 