/// <reference path="jquery-2.1.3.js" />
/// <reference path="jquery.jqGrid.src.js" />
/// <reference path="MainMenu.js" />
/// <reference path="jquery-ui-1.9.2.custom.js" />

var Router = Backbone.Router.extend({
    routes: {
        "": "start", 
        "form:id": "openForm", 
        
        "error": "error" 
    },
    start: function () {
        console.log("start");
    },
    error: function () {
        console.log("error");
    },
    openForm: function (id) {
        $.ajax({
            type: "POST",
            url: "ConstrDataService.svc/GetForm",
            data: JSON.stringify({ id: id }),
            contentType: "application/json; charset=utf-8",
            success: function (data, status, jqXHR) {
                var form = JSON.parse(data);
                $("#middlebar").append(parseForm(form));
            },
            error: function (xhr) {
                alert(xhr.responseText);
            }
        });
    }
});

var router = new Router(); // Создаём контроллер

Backbone.history.start();

function FormView(gridModel) {
    var grid = $("<div>");
    var table = $("<table>", { id: grid.id }).appendTo(grid);
    table.jqGrid({
        colModel: gridModel.columns,
        height: 200,
        autowidth: true,
        rownumbers: true,
        viewrecords: true
    });

    return grid;
}

function parseForm(formModel){
    var form = $("<div>", { id: formModel.id });
    var grid = FormView(formModel.grids[0]);
    form.append(grid);

    return form;
}

$(function () {
    $.ajax({
        type: "POST",
        //cache: false,
        url: "ConstrDataService.svc/GetMenu",
        //crossDomain: true,
        //data: JSON.stringify({ par: "123" }),
        //data: { par: "123" },
        //data: JSON.stringify({}),
        //data: "par=123",
        //contentType: "application/json; charset=utf-8",
        //contentType: false,
        //dataType: "jsonp",
        //processData: true,
        success: function (data, status, jqXHR) {
            createMainMenu(JSON.parse(data));
        },
        error: function (xhr) {
            alert(xhr.responseText);
        }
    });
    /*
    $("#mainmenu").smartmenus({
        mainMenuSubOffsetX: -1,
        subMenusSubOffsetX: 10,
        subMenusSubOffsetY: 0
    });

    $("#t").jqGrid({
        url: "ConstrDataService.svc/GetData",
        //ajaxSelectOptions: { contentType: "application/json; charset=utf-8" },
        ajaxGridOptions: { contentType: "application/json", crossDomain: true },
        datatype: "json",
        mtype: "POST",
        //colNames: ["id", "code", "name"],
        colModel: [
            { name: "id", label: "id", key: true },
            { name: "code", label: "Код" },
            { name: "name", label: "Наименование" }],
        rowNum: 20,
        pager: "#tPager",
        caption: "remember",
        scroll: 1,
        hoverrows: false,
        altRows: true,
        sortname: 'id',
        jsonReader: {
            //root: "rows",
            //page: "page",
            //total: "total",
            //records: "records",
            repeatitems: true,
            root: function (obj) { return JSON.parse(obj).rows; },
            page: function (obj) { return JSON.parse(obj).page; },
            total: function (obj) { return JSON.parse(obj).total; },
            records: function (obj) { return JSON.parse(obj).records; }
        },
        height: 500,
        autowidth: true,
        rownumbers: true,
        viewrecords: true,
        loadError: function (xhr, status, error) {
            console.log(error);
        },
        serializeGridData: function (postData) {
            return JSON.stringify(postData);
        }
    }).navGrid('#tPager', { search: true, refresh: true, add: false, del: false, edit: false, view: false },
                {}, // use default settings for edit
                {}, // use default settings for add
                {},  // delete instead that del:false we need this
                { multipleSearch: true }, // enable the advanced searching
                {} // allow the view dialog to be closed when user press ESC key
                ).jqGrid('filterToolbar', { stringResult: false });
    */
    
});