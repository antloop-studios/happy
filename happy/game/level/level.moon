Level = struct
  map:    "table"

  width:  "number"
  height: "number"
  size:   "number"

Level\impl
  init: =>
    map = {}

    for x = 0, @width
      row = {}

      for y = 0, @height
        row[y - 1] = 0

      map[x - 1] = row
    
    @map = map

  set: (x, y, val) =>
    assert x < @width and y < @height and x >= 0 and y >= 0
    @map[x][y] = val  

  get: (x, y) =>
    assert x < @width and y < @height and x >= 0 and y >= 0
    @map[x][y] 

  draw: =>
    with love.graphics
      for i = 0, @height
        .setColor 0.55, 0.55, 0.55
        .line 0, i * @size, .getWidth!, i * @size

      for i = 0, @width
        .setColor 0.55, 0.55, 0.55
        .line i * @size, 0, i * @size, .getHeight!


      for x = 0, @width - 1
        for y = 0, @height - 1
          switch @get x, y
            when 1
              .setColor 0.5, 0.5, 0.5
              .rectangle "fill", x, y, x * @size, y * @size

{
  :Level
}