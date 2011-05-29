
/******************************************* 
	im.menu 0.11
*******************************************/
(function($) {

function Menu(dte, dtr, fi) {
	this.subs = {};
	this.activeTab = false;
	this.defaultTab = false;
	this.currentTimeout = false;
	this.options = {
		delayToExpand: dte || 100,
		delayToReturn: dtr || 2700, 
		fadeInterval: 100
	};
	
	this.init = function() {
		var panel = $(".panel");
		
		if (panel.length === 0) { return false; }
		
		var subMenusContainer = $('<div class="subMenus"></div>').insertAfter(panel);
	
		var originalSub = $('ul.sub');
		
		if (originalSub.length !== 0) {
			originalSub.appendTo(subMenusContainer).css({ top: "0px" });
		}
		
		menu.activeTab = $('.panel ul li.active a');
		
		if (menu.activeTab.length !== 0) {
			var activeId = menu.activeTab[0].id;
			menu.subs[activeId] = {"tab": menu.activeTab, "menu": originalSub};
			menu.attachEvent(menu.subs[activeId]);
			menu.activeTab.parent().addClass("hover");
			menu.activeTab = activeId;
			this.defaultTab = activeId;		
			originalSub.attr("rel", menu.activeTab);
		}
		else {
			menu.activeTab = false;
		}
			
		for (var i = 0; i < submenus.length; i++) {
			if (originalSub.attr("rel") != submenus[i].id) {
				var newSubmenu = $('<ul class="sub" rel="' + submenus[i].id + '"></ul>');
				for (var j = 0; j < submenus[i].subs.length; j++) {
					newSubmenu.append('<li><a href="' + submenus[i].subs[j].u + '" title="' + submenus[i].subs[j].t + '" class="' + (submenus[i].subs[j].c) + '">' + submenus[i].subs[j].t + '</a></li>');
				}
			
				subMenusContainer.append(newSubmenu);
			
				var thisTab = $(".panel ul li a#" + submenus[i].id);
		
				menu.subs[submenus[i].id] = {"tab": thisTab, "menu": newSubmenu};
				menu.attachEvent(menu.subs[submenus[i].id]);
			}
		}
		
		subMenusContainer.hover( function () {
			if (menu.returnTimeout !== false) {	clearTimeout(menu.returnTimeout); }
		}, function () {
			if (menu.returnTimeout !== false) { clearTimeout(menu.returnTimeout); }
			
			menu.returnTimeout = setTimeout(menu.change, menu.options.delayToReturn);		
		});
		
		subMenusContainer.find("ul li a").click( function () {
			menu.defaultTab = $(this.parentNode.parentNode).attr("rel");
		});
	};
	
	this.attachEvent = function (tab) {
		tab.tab.hover( function () {
			if (menu.currentTimeout !== false) { clearTimeout(menu.currentTimeout); }
			
			if (menu.returnTimeout !== false) { clearTimeout(menu.returnTimeout); } 

			menu.currentTimeout = setTimeout('menu.change("' + this.id + '")', menu.options.delayToExpand);
		}, function () {
			if (menu.currentTimeout !== false) { clearTimeout(menu.currentTimeout); }
			
			if (menu.returnTimeout !== false) { clearTimeout(menu.returnTimeout); }
			
			menu.returnTimeout = setTimeout(menu.change, menu.options.delayToReturn);
		});
	};
	
	this.change = function(to) {	
		to = (typeof(to) == 'string') ? to : menu.defaultTab;
		
		if ((to == menu.activeTab)) { return false; }
	
		if (menu.activeTab) { menu.subs[menu.activeTab].tab.parent().removeClass("hover"); }
		if (to) { menu.subs[to].tab.parent().addClass("hover"); }
		
		if (to == menu.defaultTab) {
			if (menu.activeTab) { menu.subs[menu.activeTab].menu.animate({ top: "-25px" }, menu.options.fadeInterval); }
			if (to) { menu.subs[to].menu.css({ top: "25px" }).animate({ top: "0px" }, menu.options.fadeInterval); }
		} else {
			if (menu.activeTab) { menu.subs[menu.activeTab].menu.animate({ top: "25px" }, menu.options.fadeInterval); }
			if (to) { menu.subs[to].menu.css({ top: "-25px" }).animate({ top: "0px" }, menu.options.fadeInterval); }
		}

		menu.activeTab = to;
	};
}



$(document).ready(function(){
		menu = new Menu();
		menu.init();
});
})(jQuery);
