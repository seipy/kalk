###
000000000  000  000000000  000      00000000  0000000     0000000   00000000 
   000     000     000     000      000       000   000  000   000  000   000
   000     000     000     000      0000000   0000000    000000000  0000000  
   000     000     000     000      000       000   000  000   000  000   000
   000     000     000     0000000  00000000  0000000    000   000  000   000
###

{ stopEvent, elem, slash, post, log, $ } = require 'kxk'

pkg = require '../package.json'

class Titlebar
    
    constructor: () ->

        @elem =$ "#titlebar"
        @elem.ondblclick = (event) -> post.toMain 'maximizeWindow', window.winID
                
        @winicon = elem class: 'winicon'
        @winicon.appendChild elem 'img', src:slash.fileUrl __dirname + '/../img/menu.png'
        @elem.appendChild @winicon
        @winicon.addEventListener 'click', -> post.emit 'menuAction', 'Toggle Menu'   
        
        @title = elem class: 'titlebar-title'
        html  = "<span class='titlebar-name'>#{pkg.name}</span>"
        html += "<span class='titlebar-dot'> ● </span>"
        html += "<span class='titlebar-version'>#{pkg.version}</span>"
        @title.innerHTML = html
        @title.ondblclick = => post.toMain 'toggleMaximize'
        @elem.appendChild @title
        
        @minimize = elem class: 'winclose gray'
        @elem.appendChild @minimize
        @minimize.appendChild elem 'img', src:slash.fileUrl __dirname + '/../img/minimize.png'
        @minimize.addEventListener 'click', -> post.emit 'menuAction', 'Minimize'

        # @maximize = elem class: 'winclose gray'
        # @elem.appendChild @maximize
        # @maximize.appendChild elem 'img', src:slash.fileUrl __dirname + '/../../img/maximize.png'
        # @maximize.addEventListener 'click', -> post.emit 'menuAction', 'Maximize'
        
        @close = elem class: 'winclose'
        @elem.appendChild @close
        @close.appendChild elem 'img', src:slash.fileUrl __dirname + '/../img/close.png'
        @close.addEventListener 'click', -> post.emit 'menuAction', 'Close Window'
                
module.exports = Titlebar