## CanvasKit

This is the underlying tiling engine that powers [Alien Blue](http://itunes.apple.com/app/alien-blue-unofficial-reddit/id370144106?mt=8) and [Alien Blue HD](http://itunes.apple.com/app/alien-blue-hd-reddit-client/id390863118?mt=8)'s canvas image tiles.  Although it is very much a work in progress, the CanvasKit gives you a high performance way to present unlimited collections.

## Flexibility

At it's core, the CanvasKit is just a fast way to render tiles, but can be extended for deep user interaction.  For example, Alien Blue uses this engine to show an interactive gallery of images:

http://alienblue.org/img/ab-canvas.jpg

## Usage

Your view controller should subclass **CanvasViewController**.  You can then subclass **CanvasView** and **CanvasTileView** and overwrite `drawRect()` to render your own content.

The `canvasViewDidScrollNext`, `canvasViewDidScrollPrevious` and `canvasViewDidScrollLastPage` behaviours can be used to trigger events like loading more images.

## Caveats

The CanvasKit was tightly coupled with Alien Blue, so I'm still working on cleaning up the delegate/datasource patterns.

## License

The CanvasKit is BSD licensed, so you can freely use it in commercial applications.
