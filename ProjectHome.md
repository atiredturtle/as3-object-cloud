This framework approaches to arrange graphical objects without overlapping them or corrupting the size ratios while keeping a minimal distance to each other and trying to distribute them evenly.

Within the framework different algorithms try to find position of `IShapeSet` object-pairs containing of a the final object and its black shape. The central `ObjectCloud` class takes both a algorithm and the objects takes algorithms and objects and draws the final objects after their position was found.

There are also some utils to work with Text in order to create tag clouds based on this functionality.