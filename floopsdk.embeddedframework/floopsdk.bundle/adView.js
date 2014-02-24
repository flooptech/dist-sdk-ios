(function() {
    "use strict";


    window._floop = {};

    window._floop.clickAd = function()
    {
        var container = document.getElementById('ad-container');
        var link = findLink(container);
        link.click();
    };

    function findLink(rootElem)
    {
        var anchors = rootElem.getElementsByTagName('a');
        for (var i = 0; i < anchors.length; i++)
        {
            var anchor = anchors[i];
            if (anchor.href)
            {
                return anchor;
            }
        }
    }

    window._floop.setAnchor = function(anchor)
    {
        var root = document.getElementById('ad-root');
        var className = 'anchor-' + anchor;
        root.className = className;
    };


})();

