"use strict";
/*global CKEDITOR:false */
if (!CKEDITOR.stylesSet.get("default")) {
    CKEDITOR.stylesSet.add( "default", [
        { name: "Absatz",                   element: "p" },
        { name: "Überschrift 1",            element: "h1" },
        { name: "Überschrift 2",            element: "h2" },
        { name: "Überschrift 3",            element: "h3" },
        { name: "Überschrift 4",            element: "h4" },
        // { name: "Klein-Überschrift",        element: "h4" },
        { name: "Button",                   element: "a",
                                            attributes: { "class":"btn btn-default" }},
        // { name: "Button / Grün",            element: "span",
        //                                     attributes: { "class":"btn btn-primary" }},
        // { name: "Button / ? / Grün",        element: "span",
        //                                     attributes: { "class":"btn btn-primary iconContact" }},
        // { name: "Link mit Pfeil / Weiss",   element: "a",
        //                                     attributes: { "class":"arrow middle" }},
        // { name: "Grau",                     element: "span",
        //                                     attributes: { "class":"from" }}
    ]);
}
