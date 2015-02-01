/*var MainMenuAction = {
    id: 0,
    code: "",
    name: "",
    actionType: ""
}

var MainMenuItem ={
    id: 0,
    code: "",
    name: "",
    mainMenuItems: [],
    mainMenuAction: []
};

var MainMenu = {
    id: 0,
    code: "",
    name: "",
    MainMenuItems: []
};
*/
function createAction(action) {
    return $("<li>")
                .append($("<a>", {
                    id: action.id,
                    text: action.name,
                    actionType: action.idActionType,
                    href: "#form" + action.idObjFrm,
                    idObjFrm: action.idObjFrm
                }));
}


function createMainMenuItem(mmi) {
    var ul = $("<ul>");
    var items = mmi.mainMenuItems;
    if (items) {
        for (var i = 0; i < items.length; i++) {
            if (items[i].mainMenuItems) {
                ul.append($("<li>").append($("<a>", {
                    text: items[i].name
                })).append(createMainMenuItem(items[i])));
            }
        }
    }
    var actions = mmi.mainMenuActions;
    if (actions) {
        for (var a = 0; a < actions.length; a++) {
            ul.append(createAction(actions[a]));
        }
    }
    return ul;
}

function createMainMenu(mm) {
    var ul = createMainMenuItem(mm);
    ul.attr({
        id: "mainmenu",
        "class": "sm sm-simple"
    }).appendTo("#topbar");
    ul.smartmenus({});
}