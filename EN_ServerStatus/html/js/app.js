

window.onload = function () {

	var eventCallback = {
		
		element: function(data) {
			if (data.task == 'enable') { document.querySelector('#'+data.value).style.display = 'block'; }
			else if (data.task == 'disable') { document.querySelector('#'+data.value).style.display = 'none'; }
		},
	};

	window.addEventListener('message', function(event) {
		eventCallback[event.data.action](event.data);
	});
}