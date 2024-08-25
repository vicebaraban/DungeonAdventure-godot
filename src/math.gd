extends Node


func coord_quarter(x1, y1, x2, y2):
    if x2 > x1 and y2 < y1:
        return 1
    elif x2 < x1 and y2 < y1:
        return 2
    elif x2 < x1 and y2 > y1:
        return 3
    elif x2 > x1 and y2 > y1:
        return 4
    return 0


func calculate_angle(x1, y1, x2, y2):
    var quarter = coord_quarter(x1, y1, x2, y2)
    var len_x = x2 - x1
    var len_y = y1 - y2
    var angle
    if not quarter:
        if len_y == 0 and len_x > 0:
            angle = 90
        elif len_y == 0 and len_x < 0:
            angle = 270
        elif len_x == 0 and len_y < 0:
            angle = 180
        else:
            angle = 0
    elif quarter == 1:
        angle = rad_to_deg(atan(len_x / len_y))
    elif quarter == 2:
        angle = 270 - rad_to_deg(atan(len_y / len_x))
    elif quarter == 3:
        angle = 180 + rad_to_deg(atan(len_x / len_y))
    else:
        angle = 90 - rad_to_deg(atan(len_y / len_x))
    return angle


func calculate_direction(x1, y1, x2, y2):
    var x = x2 - x1
    var y = y2 - y1
    var z = sqrt(x ** 2 + y ** 2)
    var dx = x / z
    var dy = y / z
    return Vector2(dx, dy)

func hypotenuse(x1, y1, x2, y2):
    return sqrt((x1 - x2) ** 2 + (y1 - y2) ** 2)

# func calculate_direction_angle(x, y, angle):
#     pass
