--- IMPORTANT ---
--- Do not build with this file, it is for documentation purposes only.


-- TODO:
--- complete land
--- airbase
--- controller
--- 
--- 
---@class Vec2
---@field x number
---@field y number

---@class Vec3
---@field x number
---@field y number
---@field z number

---@class Event
---@field id number

---@class Ammo
---@field count number
---@field desc table

---@class MarkPanel
---@field idx any idxMark(IDMark)??
---@field time number
---@field initiator Unit
---@field coalition Coalition
---@field groupId number -1 or id
---@field text string
---@field pos Vec3

---@class StaticObjectData
---@field heading number
---@field groupId number
---@field shape_name string
---@field type string required
---@field unitId number
---@field rate number
---@field name string required
---@field category string
---@field x number required
---@field y number required
---@field dead boolean

---@class RequiredGroupData

---@class GroupData
---@field name string
---@field task string
---@field units table<integer, UnitData>
---@field tasks table<integer, TaskData>
---@field groupId? number
---@field start_time? number
---@field lateActivation? boolean
---@field hidden? boolean
---@field hiddenOnPlanner? boolean
---@field hiddenOnMFD? boolean
---@field route? Route

---@class AirGroupData: GroupData
---@field uncontrolled? boolean
---@field modulation? number 0-1
---@field frequency? number
---@field communication? boolean 

---@class GroundGroupData: GroupData
---@field visible? boolean
---@field uncontrollable? boolean
---@field manualHeading? boolean

---@class ShipGroupData: GroupData
---@field visible? boolean
---@field uncontrollable? boolean

---@enum Skill
local skill = {
    Excellent = "Excellent",
    High = "High",
    Good = "Good",
    Average = "Average",
    Random = "Random",
    Player = "Player"
}

---@class UnitData
---@field name string Required
---@field type string Required
---@field x number Required
---@field y number Required
---@field unitId? number
---@field heading? number
---@field skill? Skill

---@class WeaponData
---@field CLSID string

---@class PayloadData
---@class pylons? table<integer, WeaponData>
---@field fuel? number
---@field flare? number
---@field chaff? number
---@field gun? number
---@field ammo_type? number

---@class AirUnitData: UnitData
---@field alt number Required in Meters
---@field alt_type AltType Required
---@field speed number Required in m/s
---@field payload PayloadData Required
---@field callsign string Required
---@field AddPropAircraft? table
---@field livery_id? string
---@field psi? number
---@field onboard_num? string
---@field parking_landing? number
---@field parking_landing_id? string
---@field parking? string
---@field parking_id? string
---@field datalinks? table
---@field ropeLength? number

---@class GroundUnitData: UnitData
---@field coldAtStart? boolean
---@field playerCanDrive? boolean

---@class Object
---https://wiki.hoggitworld.com/view/DCS_Class_Object
---Represents an object with body, unique name, category and type. Non-final class
---@field Category ObjectCategory
Object = {}

---@enum ObjectCategory
local ObjectCategory = {
  UNIT    = 1,
  WEAPON  = 2,
  STATIC  = 3,
  BASE    = 4,
  SCENERY = 5,
  Cargo   = 6
}

Object.Category = {
  UNIT    = 1,
  WEAPON  = 2,
  STATIC  = 3,
  BASE    = 4,
  SCENERY = 5,
  Cargo   = 6
}

---https://wiki.hoggitworld.com/view/DCS_func_isExist
---Return a boolean value based on whether the object currently exists in the mission.
---@return boolean exist
function Object:isExist()
end

---https://wiki.hoggitworld.com/view/DCS_func_destroy
---Destroys the object, physically removing it from the game world without creating an event. The object simply disappears. If used with a group, the entire group will be destroyed.
function Object:destroy()
end

---https://wiki.hoggitworld.com/view/DCS_func_getCategory
---Returns an enumerator of the category for the specific object. The enumerator returned is dependent on the category of the object and how the function is called. As of DCS 2.9.2 when this function is called on an Object, Unit, Weapon, or Airbase a 2nd value will be returned which details the object sub-category value.
---@return ObjectCategory category, number subCategory
function Object:getCategory()
end

---https://wiki.hoggitworld.com/view/DCS_func_getTypeName
---Return a string of the objects type name.
---@return string typeName
function Object:getTypeName()
end

---https://wiki.hoggitworld.com/view/DCS_func_getDesc
---Return a description table of the given object. Table entries are dependent on the category of object and the sub-categories that may exist within that object type.
---@return table desc
function Object:getDesc()
end

---https://wiki.hoggitworld.com/view/DCS_func_hasAttribute
---Returns a boolean value if the object in question has the passed attribute. See Article list of Attributes or db_attibutes.lua in C:\Program Files\Eagle Dynamics\DCS World\Scripts\Database for more details. Additionally attributes for each object are defined within their DB lua file. DB files provided on github for reference.
---@param attribute string
---@return boolean hasAttribute
function Object:hasAttribute(attribute)
end

---https://wiki.hoggitworld.com/view/DCS_func_getName
---Returns a string of the name of the object as defined by the mission editor or dynamic spawning functions.
---@return string name
function Object:getName()
end

---https://wiki.hoggitworld.com/view/DCS_func_getPoint
---Returns a vec3 table of the x, y, and z coordinates for the position of the given object in 3D space. Coordinates are dependent on the position of the maps origin. In the case of the Caucuses theater, the origin is located in the Crimean region of the map.
---@return Vec3 point
function Object:getPoint()
end

---https://wiki.hoggitworld.com/view/DCS_func_getPosition
---Returns a Position3 table of the objects current position and orientation in 3D space.
--- X, Y, Z values are unit vectors, starting from the- object's center, defining the object's orientation:
--- X points forward, extending 'out the front'
--- Y points upwards, extending 'out the top'
--- Z points to the right.
---@return Pos position
function Object:getPosition()
end

---https://wiki.hoggitworld.com/view/DCS_func_getVelocity
---Returns a vec3 table of the objects velocity vectors.
---@return Vec3 velocity
function Object:getVelocity()
end

---https://wiki.hoggitworld.com/view/DCS_func_inAir
---Returns a boolean value if the object in question is in the air.
---@return boolean inAir
function Object:inAir()
end

---@class Unit: Object
---https://wiki.hoggitworld.com/view/DCS_Class_Unit
---Represents units: airplanes, helicopters, vehicles, ships and armed ground structures.
---@field Category Category
---@field RefuelingSystem RefuelingSystem
---@field SensorType SensorType
---@field OpticType OpticType
Unit = {}

---@enum Category
local Category = {
    AIRPLANE      = 0,
    HELICOPTER    = 1,
    GROUND_UNIT   = 2,
    SHIP          = 3,
    STRUCTURE     = 4
}

Unit.Category = {
    AIRPLANE      = 0,
    HELICOPTER    = 1,
    GROUND_UNIT   = 2,
    SHIP          = 3,
    STRUCTURE     = 4
}

---@enum SensorType
local SensorType = {
    OPTIC     = 0,
    RADAR     = 1,
    IRST      = 2,
    RWR       = 3
}

Unit.SensorType = {
    OPTIC     = 0,
    RADAR     = 1,
    IRST      = 2,
    RWR       = 3
}

---@enum OpticType
local OpticType = {
    TV     = 0, --TV-sensor
    LLTV   = 1, --Low-level TV-sensor
    IR     = 2  --Infra-Red optic sensor
}

Unit.OpticType = {
    TV     = 0, --TV-sensor
    LLTV   = 1, --Low-level TV-sensor
    IR     = 2  --Infra-Red optic sensor
  }

---@enum RefuelingSystem
RefuelingSystem = {
    BOOM_AND_RECEPTACLE   = 0,
    PROBE_AND_DROGUE      = 1
}

Unit.RefuelingSystem = {
    BOOM_AND_RECEPTACLE   = 0,
    PROBE_AND_DROGUE      = 1
}

---@enum RadarType
local RadarType = {
    AS    = 0, --air search radar
    SS    = 1 --surface/land search radar
}

Unit.RadarType = {
    AS    = 0, --air search radar
    SS    = 1 --surface/land search radar
}

---@enum OptialOrRadarType
---combination of both
local OptialOrRadarType = {
    TV    = 0, --TV-sensor
    LLTV  = 1, --Low-level TV-sensor
    IR    = 2, --Infra-Red optic sensor
    AS    = 0, --air search radar
    SS    = 1 --surface/land search radar
}

---https://wiki.hoggitworld.com/view/DCS_func_isActive
---Returns a boolean value if the unit is activated. Units set to late activation would return false if checked by this function.
---@return boolean active
function Unit:isActive()
end

---https://wiki.hoggitworld.com/view/DCS_func_getPlayerName
---Returns a string value of the name of the player if the unit is currently controlled by a player. If a unit is controlled by AI the function returns nil.
---@return string playerName
function Unit:getPlayerName()
end

---https://wiki.hoggitworld.com/view/DCS_func_getID
---Returns a number which defines the unique mission id of a given object.
---@return number id positve integer
function Unit:getID()
end

---https://wiki.hoggitworld.com/view/DCS_func_getNumber
---Returns a numerical value of the default index of the specified unit within the group as defined within the mission editor or addGroup scripting function. This value is not changed as units within the group are destroyed.
---@return number number
function Unit:getNumber()
end

---https://wiki.hoggitworld.com/view/DCS_func_getCategoryEx
---	Returns an enumerator of the category for the specific object. The enumerator returned is dependent on the category of the object and how the function is called.
---@return Category category
function Unit:getCategoryEx()
end

---https://wiki.hoggitworld.com/view/DCS_func_getObjectID
---Returns the runtime object Id associated with the unit. Every single object on the map is represented by a unique objectID value.
---@return number objectID
function Unit:getObjectID()
end

---https://wiki.hoggitworld.com/view/DCS_func_getController
---Returns the controller of the specified object.
--- Ships and ground units can only be controlled at a group level.
--- Airplanes and helicopters can be controlled at both a group and unit level.
---@return Controller controller
function Unit:getController()
end

---https://wiki.hoggitworld.com/view/DCS_func_getGroup
---Returns the Group object that the Unit belongs to.
---@return Group group
function Unit:getGroup()
end

---https://wiki.hoggitworld.com/view/DCS_func_getCallsign
---Returns a localized string of the units callsign. In the case of airbases the callsign of world airbases is defined by the game. Callsigns for units, farps, or ships can be specified by the user with the mission editor or scripting engine.
---@return string callsign e.g Uzi 11
function Unit:getCallsign()
end

---https://wiki.hoggitworld.com/view/DCS_func_getLife
---Returns the current "life" of a unit. Also referred to as "hit points". All units in DCS have a value that defines how much life is left. If this value is less than 1 the unit is considered "dead". Ground and ship units that are on fire and in the process of "cooking off" will return a life value of 0 until the object explodes. Aircraft are more complex due to sub-systems and damage models which will effect the life value.
---@return number life
function Unit:getLife()
end

---https://wiki.hoggitworld.com/view/DCS_func_getLife0
---Returns the initial life value of a unit. All units spawn with "max HP" and this value will never change. Can be used with Unit.getLife() to determine the percentage of a units life as each unit has a unique life value.
---@return number life
function Unit:getLife0()
end

---https://wiki.hoggitworld.com/view/DCS_func_getFuel
---Returns a percentage of the current fuel remaining in an aircraft's inventory based on the maximum possible fuel load. Value ranges from 0.00 to 1.00. If external fuel tanks are present the value may display above 1.0. Fuel is always drained from the external tanks before moving to internal tanks.
---Ground vehicles and ships will always return a value of 1.
---@return number fuel e.g: 0.85
function Unit:getFuel()
end

---https://wiki.hoggitworld.com/view/DCS_func_getAmmo
---Returns an ammo table for all types of loaded ammunition on a given object. Ammo table is indexed by ammo type and contains a weapon description table and a count variable defining "how much" is on board.
---@return table<integer, Ammo> ammo
function Unit:getAmmo()
end

---https://wiki.hoggitworld.com/view/DCS_func_getSensors
---Returns a table defining each of the sensors available to the specified unit.
---@return table sensords
function Unit:getSensors()
end

---https://wiki.hoggitworld.com/view/DCS_func_hasSensors
---Returns true if the unit has the specified sensors. If SensorType is not specified the function will return true if the unit has any type of sensors.
---Some sensorTypes have additional subcategories which can be used to further specify for certain sensors.
---@param sensorType? SensorType
---@param subCategory? OptialOrRadarType
---@return boolean hasSensors
function Unit:hasSensors(sensorType, subCategory)
end

---https://wiki.hoggitworld.com/view/DCS_func_getRadar
---Returns two values. The first value is a boolean indicating if any radar on the Unit is operational. The second value is the Object the radar is most interested in and/or actively tracking.
---@return boolean radarOperational, Unit radarTarget
function Unit:getRadar()
end

---https://wiki.hoggitworld.com/view/DCS_func_getDrawArgumentValue
---Returns the current value for an animation argument on the external model of the given object. Each model animation has an id tied to with different values representing different states of the model. Animation arguments can be figured out by opening the respective 3d model in the modelviewer.
---For example you can determine the rotation and orientation of the barrel of a Tanks cannon by checking its animation arguments. More practically you can determine whether or not a helicopters doors are open.
---If draw argument value is invalid for the unit in question a value of 0 will be returned.
---@param number number 
---@return number value -1 to 1 
function Unit:getDrawArgumentValue(number)
end

---https://wiki.hoggitworld.com/view/DCS_func_getNearestCargos
---Returns a table of friendly cargo objects indexed numerically and sorted by distance from the helicopter.
---Returns nil if used on any object other than a helicopter.
---@return table<integer, Unit> cargos
function Unit:getNearestCargos()
end

---https://wiki.hoggitworld.com/view/DCS_func_enableEmission
---Sets the passed group or unit objects radar emitters on or off. Can be used on sam sites for example to shut down the radar without setting AI off or changing the alarm state.
--- @param radarOn boolean
function Unit:enableEmission(radarOn)
end

---https://wiki.hoggitworld.com/view/DCS_func_getDescentCapacity
---Returns the number of infantry that can be embark onto the aircraft. Only returns a value if run on airplanes or helicopters.
---@return number capacity
function Unit:getDescentCapacity()
end

---@class Group
---https://wiki.hoggitworld.com/view/DCS_Class_Group
---Represents a group of units.
---@field Category GroupCategory
Group = {}

---@enum GroupCategory
local GroupCategory = {
    AIRPLANE      = 0,
    HELICOPTER    = 1,
    GROUND        = 2,
    SHIP          = 3,
    TRAIN         = 4
}

Group.Category = {
    AIRPLANE      = 0,
    HELICOPTER    = 1,
    GROUND        = 2,
    SHIP          = 3,
    TRAIN         = 4
}

---https://wiki.hoggitworld.com/view/DCS_func_isExist
---Return a boolean value based on whether the object currently exists in the mission.
---@return boolean exist
function Group:isExist()
end

---https://wiki.hoggitworld.com/view/DCS_func_activate
---Activates the group if the group has a delayed start or late activation.
function Group:activate()
end

---https://wiki.hoggitworld.com/view/DCS_func_destroy
---Destroys the object, physically removing it from the game world without creating an event. The object simply disappears. If used with a group, the entire group will be destroyed.
---@return function unknown 
function Group:destroy()
end

---https://wiki.hoggitworld.com/view/DCS_func_getCategory
---Returns an enumerator of the category for the specific object. The enumerator returned is dependent on the category of the object and how the function is called. As of DCS 2.9.2 when this function is called on an Object, Unit, Weapon, or Airbase a 2nd value will be returned which details the object sub-category value.
---@return ObjectCategory category, number subCategory
function Group:getCategory()
end

---https://wiki.hoggitworld.com/view/DCS_func_getName
---Returns a string of the name of the object as defined by the mission editor or dynamic spawning functions.
---@return string name
function Group:getName()
end

---https://wiki.hoggitworld.com/view/DCS_func_getID
---Returns a number which defines the unique mission id of a given object.
---@return number id positive integer
function Group:getID()
end

---https://wiki.hoggitworld.com/view/DCS_func_getUnit
---Returns the unit object of the specified unitIndex within the group. If the index is not valid, this function will return nil.
---@param unitIndex number
---@return Unit unit
function Group:getUnit(unitIndex)
end

---https://wiki.hoggitworld.com/view/DCS_func_getUnits
---Returns a table of unit objects indexed in unit order. Useful for getting unit specific data for every unit in the group.
---@return table<integer, Unit> units
function Group:getUnits()
end

---https://wiki.hoggitworld.com/view/DCS_func_getSize
---Returns the current size of the group. This value will change as units are destroyed. Can be used in combination with getUnit to not accidentally use to big a value for that function, or to access the last unit in the group.
---@return number size
function Group:getSize()
end

---https://wiki.hoggitworld.com/view/DCS_func_getInitialSize
---Returns the initial size of the group as defined in the mission editor or if spawned via function. This number will not change as units are destroyed.
---@return number initialSize
function Group:getInitialSize()    
end

---https://wiki.hoggitworld.com/view/DCS_func_getController
---Returns the controller of the specified object.
---@return Controller controller
function Group:getController()
end

---https://wiki.hoggitworld.com/view/DCS_func_enableEmission
---Sets the passed group or unit objects radar emitters on or off. Can be used on sam sites for example to shut down the radar without setting AI off or changing the alarm state.
---@param radarOn boolean
function Group:enableEmission(radarOn)
end


---@class StaticObject: Object
---https://wiki.hoggitworld.com/view/DCS_Class_Static_Object
---Represents static objects added in the Mission Editor or via scripting commands.
StaticObject = {}

---https://wiki.hoggitworld.com/view/DCS_func_getID
---Returns a number which defines the unique mission id of a given object.
---@return number id positive integer
function StaticObject:getId()
end

---https://wiki.hoggitworld.com/view/DCS_func_getLife
---Returns the current "life" of a unit. Also referred to as "hit points". All units in DCS have a value that defines how much life is left. If this value is less than 1 the unit is considered "dead". Ground and ship units that are on fire and in the process of "cooking off" will return a life value of 0 until the object explodes. Aircraft are more complex due to sub-systems and damage models which will effect the life value.
---@return number life
function StaticObject:getLife()
end

---https://wiki.hoggitworld.com/view/DCS_func_getCargoDisplayName
---Returns a string of a cargo objects mass in the format ' mass kg'
---@return string mass kg
function StaticObject:getCargoDisplayName()
end

---https://wiki.hoggitworld.com/view/DCS_func_getCargoWeight
---Returns the mass of a cargo object measured in kg.
---@return number mass kg
function StaticObject:getCargoWeight()
end

---https://wiki.hoggitworld.com/view/DCS_func_getDrawArgumentValue
---Returns the current value for an animation argument on the external model of the given object. Each model animation has an id tied to with different values representing different states of the model. Animation arguments can be figured out by opening the respective 3d model in the modelviewer.
---@param number number
---@return number value -1 to 1
function StaticObject:getDrawArgumentValue(number)
end


---@class Controller
---https://wiki.hoggitworld.com/view/DCS_Class_Controller
---Controller is an object that performs AI-routines. In other words a controller is an instance of the AI. Controller stores the current main task, active enroute tasks, and behavior options. Controllers also can perform commands. Controllers exist at both a group and unit level. However only planes and helicopters can be controlled individually at a unit level. Some functions can only work for Unit Controllers.
---Different tasks, options, and commands are available for the different group types. (Plane, Helicopter, Ground Unit, and Ship). See the linked articles on these subjects for more information.
Controller = {}

---https://wiki.hoggitworld.com/view/DCS_func_setTask
---Sets the specified task to the units or groups associated with the controller object. Tasks must fit a specified format. For more information see the specific task page you are looking for:
---@param task table
---@return function
function Controller:setTask(task)
end

---https://wiki.hoggitworld.com/view/DCS_func_resetTask
---Resets the current task assigned to the controller.
---@return function
function Controller:resetTask()
end

---https://wiki.hoggitworld.com/view/DCS_func_pushTask
---Pushes the specified task to the front of the tasking queue. If no other tasks are currently active it will function effectively the same as Controller.setTask()
---@param task table
---@return function
function Controller:pushTask(task)
end

---https://wiki.hoggitworld.com/view/DCS_func_popTask
---Removes the top task from the tasking queue.
---@return function
function Controller:popTask()
end

---https://wiki.hoggitworld.com/view/DCS_func_hasTask
---Returns true if the controller currently has a task.
---@return boolean hasTask
function Controller:hasTask()
end

---https://wiki.hoggitworld.com/view/DCS_func_setCommand
---See documentation for a list of commands
---@param command table
---@return function
function Controller:setCommand(command)
end

---https://wiki.hoggitworld.com/view/DCS_func_setOption
---Options are a pair of identifier and value. Behavior options are global parameters and will affect controller behavior in all tasks it performs. Options are executed immediately.
---For example Rules of Engagement (ROE) are an option that can dictate whether or not a group is currently allowed to attack. This option can over-ride tasking to attack specific targets.
---@param option number
---@param value any
---@return function
function Controller:setOption(option, value)
end

---@enum AltType
local altType = {
    RADIO = "RADIO",
    BARO  = "BARO"
}

---https://wiki.hoggitworld.com/view/DCS_func_setOnOff
---Enables or disables the AI controller for the specified group or unit. When AI is turned off the units are incapable of moving, shooting, or detecting targets.
---@param on boolean
---@return function
function Controller:setOnOff(on)
end

---https://wiki.hoggitworld.com/view/DCS_func_setAltitude
---Sets the controlled aircraft group to the specified altitude in meters.
---@param altitude number m
---@param keep? boolean
---@param altType? AltType
---@return function
function Controller:setAltitude(altitude, keep, altType)
end

---https://wiki.hoggitworld.com/view/DCS_func_setSpeed
---Sets the controlled group to go the specified speed in meters per second.
---@param speed number m/s
---@param keep? boolean
---@return function
function Controller:setSpeed(speed, keep)
end

---https://wiki.hoggitworld.com/view/DCS_func_knowTarget
---Forces the controller to become aware of the specified target, without the controller manually detecting the object itself.
---TODO: figure out real types
---@param object any
---@param type boolean does it know the type?
---@param distance boolean does it know the distance?
---@return function
function Controller:knowTarget(object, type, distance)
end

---@enum DetectionType
local detectionType = {
    VISUAL=  1,
    OPTIC =  2,
    RADAR =  4,
    IRST  =  8,
    RWR   =  16,
    DLINK =  32
}

---https://wiki.hoggitworld.com/view/DCS_func_isTargetDetected
---@param target Object
---@param detectionType DetectionType add extra detection types after this
---@return boolean
function Controller:isTargetDetected(target, detectionType)
end


---@class DetectedTarget
---@field object Object
---@field visible boolean
---@field type boolean is the target type known?
---@field distance boolean is the distance known?

---https://wiki.hoggitworld.com/view/DCS_func_getDetectedTargets
---Returns a table of detected targets that are detected by the different detection methods. If not detection method is specified, then all forms of detection will be used.
---@param detectionType? DetectionType allows multiple detection type parameters
---@return table<integer, DetectedTarget> detectedTargets
function Controller:getDetectedTargets(detectionType)
end


---@enum SurfaceType
local SurfaceType = {
    LAND = 1,
    SHALLOW_WATER = 2,
    WATER = 3,
    ROAD = 4,
    RUNWAY = 5
}

---@enum RoadType
local RoadType = {
    ROAD = "roads",
    RAIL = "railroads",
}

---@enum RoadType2
local RoadType = {
    ROAD = "roads",
    RAIL = "rails" 
}

---@class Pos
---@field x Vec3
---@field y Vec3
---@field z Vec3
---@field p Vec3

---https://wiki.hoggitworld.com/view/DCS_singleton_env
---env contains basic logging functions useful for debugging scripting commands. The input text is automatically added to dcs.log in your saved games folder, default location: C:\Users\<<userName>>\Saved Games\DCS\Logs
env = {}

---https://wiki.hoggitworld.com/view/DCS_func_info
---@param log string
---@param showMessageBox? boolean
function env.info(log, showMessageBox)
end

---https://wiki.hoggitworld.com/view/DCS_func_warning
---@param log string
---@param showMessageBox? boolean
function env.warning(log, showMessageBox)
end

---https://wiki.hoggitworld.com/view/DCS_func_error
---@param log string
---@param showMessageBox? boolean
function env.error(log, showMessageBox)
end

---https://wiki.hoggitworld.com/view/DCS_func_setErrorMessageBoxEnabled
---Sets the value for whether or not an error message box will be displayed if a lua error occurs. By default the error message box will appear.
---@param toggle boolean
function env.setErrorMessageBoxEnabled(toggle)
end

---https://wiki.hoggitworld.com/view/DCS_func_getValueDictByKey
---Returns a string associated with the passed dictionary key value. If the key is not found within the miz the function will return the string that was passed.
---@param value string
---@return string
function env.getValueDictByKey(value)
end

---@class Timer
---https://wiki.hoggitworld.com/view/DCS_singleton_timer
---The timer singleton has two important uses.
timer = {}

---https://wiki.hoggitworld.com/view/DCS_func_getTime
---Returns the model time in seconds to 3 decimal places since the mission has started. This counts time once the mission starts and will pause with the game.
---@return number time e.g 123.456
function timer.getTime()
end

---https://wiki.hoggitworld.com/view/DCS_func_getAbsTime
---Returns the game world time in seconds relative to time the mission started. Will always count up from when the mission started. If the value is above 86400 then it is the next day after the mission started. This function is useful in attaining the time of day.
--Assuming a mission started at noon the value returned would be 43200. (12*60*60). Midnight would be 0. Calling this function at 12:00:10 timer.getAbsTime will return 43210.xxx.
---@return number time e.g 123.456
function timer.getAbsTime()
end

---https://wiki.hoggitworld.com/view/DCS_func_getTime0
---Returns the mission start time in seconds. Can be used with timer.getAbsTime() to see how much time has passed in the mission.
---@return number time e.g 123.456
function timer.getTime0()
end

---https://wiki.hoggitworld.com/view/DCS_func_scheduleFunction
---Schedules a function to run at a time in the future. This is a very powerful function.
---The function that is called is expected to return nil or a number which will indicate the next time the function will be rescheduled. Use the second argument in that function to retrieve the current time and add the desired amount of delay (expressed in seconds).
---@param functionToCall function
---@param anyFunctionArguement any
---@param modelTime number
---@return number functionId
function timer.scheduleFunction(functionToCall, anyFunctionArguement, modelTime)
end

---https://wiki.hoggitworld.com/view/DCS_func_removeFunction
---Removes a scheduled function as defined by the functionId from executing. Essentially will "destroy" the function.
---@param functionId number
function timer.removeFunction(functionId)
end

---https://wiki.hoggitworld.com/view/DCS_func_setFunctionTime
---Re-Schedules an already scheduled function to run at a different time in the future.
---@param functionId number
---@param modelTime number
function setFunctionTime(functionId, modelTime)
end

---https://wiki.hoggitworld.com/view/DCS_singleton_land
---The land singleton contains functions used to get information about the terrain geometry of a given map. Functions include getting data on the type and height of terrain at a specific points and raytracing functions.
---@class Land
land = {}

land.SurfaceType = {
    LAND = 1,
    SHALLOW_WATER = 2,
    WATER = 3,
    ROAD = 4,
    RUNWAY = 5
}

---https://wiki.hoggitworld.com/view/DCS_func_getHeight
---Returns the distance from sea level (y-axis) of a given vec2 point.
---@param vec2 Vec2
---@return number height
function land.getHeight(vec2)
end

---https://wiki.hoggitworld.com/view/DCS_func_getSurfaceHeightWithSeabed
---Returns the surface height and depth of a point. Useful for checking if the path is deep enough to support a given ship. Both values are positive. When checked over water at sea level the first value is always zero. When checked over water at altitude, for example the reservoir of the Inguri Dam, the first value is the corresponding altitude the water level is at.
---@param vec2 Vec2
---@return number alt, number depth
function land.getSurfaceHeightWithSeabed(vec2)
end

---https://wiki.hoggitworld.com/view/DCS_func_getSurfaceType
---Returns an enumerator for the surface type at a given point.
---@param vec2 Vec2
---@return SurfaceType surfaceType Enum: land.SurfaceType
function land.getSurfaceType(vec2)
end

---https://wiki.hoggitworld.com/view/DCS_func_isVisible
---Returns the boolean value if there is an terrain intersection via drawing a virtual line from the origin to the destination. Used for determining line of sight.
---@param origin Pos
---@param destination Pos
---@return boolean visible
function land.isVisible(origin, destination)
end

---https://wiki.hoggitworld.com/view/DCS_func_getIP
---Returns the intersection point of a line drawn from the origin in the direction of the vector. The distance is the distance from the origin to the intersection point. Useful for determining where a missile will hit the ground.
---@param origin Pos
---@param direction number some bearing?
---@param distance number
---@return Pos intersectionPoint
function land.getIP(origin, direction, distance)
end

---https://wiki.hoggitworld.com/view/DCS_func_profile
---Returns a table of vectors that make up the profile of the land between the two passed points.
-- The spacing and quantity of returned vectors is not entirely known to the author. Requires further testing.
---@param from Vec3
---@param to Vec3
---@return table<integer, Vec3> profile
function land.Profile(from, to)
end

---https://wiki.hoggitworld.com/view/DCS_func_getClosestPointOnRoads
---Returns the X and Y values of a coordinate on the nearest road from the given point.
---@param roadType RoadType
---@param x number
---@param y number
---@return number x, number y
function land.getClosestPointOnRoads(roadType, x, y)
end

---https://wiki.hoggitworld.com/view/DCS_func_findPathOnRoads
---Returns a table of points along a that define a route from a starting point to a destination point.
-- Returned table is a table of vec2 points indexed numerically from starting point to destination. Table can return a high number of points over a relatively short route. So expect to iterate through a large number of values.
-- NOTE!!! A bug exists where the value for railroads is actually 'rails'. This is different from the sister function getClosestPointOnRoads!
---@param roadType RoadType2
---@param x number
---@param y number
---@param destx number
---@param desty number
---@return table<integer, Vec2> path
function land.findPathOnRoads(roadType, x, y, destx, desty)
end

---https://wiki.hoggitworld.com/view/DCS_singleton_atmosphere
--- atmosphere is a singleton whose functions return atmospheric data about the mission. Currently limited only to wind data.
atmosphere = {}

---https://wiki.hoggitworld.com/view/DCS_func_getWind
---Returns a velocity vector of the wind at a specified point
---@param vec3 Vec3
---@return Vec3 wind
function atmosphere.getWind(vec3)
end

---https://wiki.hoggitworld.com/view/DCS_func_getWindWithTurbulence
---Returns a velocity vector of the wind at a specified point, this time factoring turbulence into the equation.
---@param vec3 Vec3
---@return Vec3 wind
function atmosphere.getWindWithTurbulence(vec3)
end

---https://wiki.hoggitworld.com/view/DCS_func_getTemperatureAndPressure
---Returns the temperature and pressure at a given point in 3d space.
-- Temperature is returned in Kelvins Pressure is returned in Pascals
---@param vec3 Vec3
---@return number temperature, number pressure
function atmosphere.getTemperatureAndPressure(vec3)
end


---@class World
---https://wiki.hoggitworld.com/view/DCS_singleton_world
---The world singleton contains functions centered around two different but extremely useful functions.
world = {}

---https://wiki.hoggitworld.com/view/DCS_func_addEventHandler
---	Adds a function as an event handler that executes whenever a simulator event occurs. The most common uses of event handlers are to track statistics of units within a given scenario and to execute code based on certain events occurring. Handlers are passed event tables which contains numerous data regarding the event.
---@param handler function<nil, Event>
---@return function
function world.addEventHandler(handler)
end

---https://wiki.hoggitworld.com/view/DCS_func_removeEventHandler
---Removes the specified event handler from handling events. Use this when an event handler has outlived its usefulness.
---@param handler function
---@return function
function world.removeEventHandler(handler)
end

---https://wiki.hoggitworld.com/view/DCS_func_getPlayer
---Returns a table of the single unit object in the game who's skill level is set as "Player". There is only a single player unit in a mission and in single player the user will always spawn into this unit automatically unless other client or Combined Arms slots are available.
---@return Unit player
function world.getPlayer()
end

---https://wiki.hoggitworld.com/view/DCS_func_getAirbases
---Returns a table of airbase objects belonging to the specified coalition. Objects can be ships, static objects(FARP), or airbases on the map.
---When the function is run as world.getAirbases() no input values required, and the function returns all airbases, ships, and farps on the map.
---@param coailitionId CoalitionEnum Emum: coalition.side
---@return table<integer, Airbase> airbases
function world.getAirbases(coailitionId)
end

---@enum VolumeType
local VolumeType = {
    SEGMENT = 0,
    BOX = 0,
    SPHERE = 0,
    PYRAMID = 0
}

world.VolumeType = {
    SEGMENT = 0,
    BOX = 0,
    SPHERE = 0,
    PYRAMID = 0
}

---https://wiki.hoggitworld.com/view/DCS_volume_pyramid
---https://wiki.hoggitworld.com/view/DCS_volume_segment
---https://wiki.hoggitworld.com/view/DCS_volume_sphere
---https://wiki.hoggitworld.com/view/DCS_volume_box
---@class VolumeParamsParams
---@field pos Pos PYRAMID
---@field length number PYRAMID distance
---@field halfAngleHor number PYRAMID angle
---@field halfAngleVer number PYRAMID angle
---@field from Vec3 SEGMENT
---@field to Vec3 SEGMENT
---@field point Vec3 SPHERE
---@field radius number SPHERE
---@field min Vec3 BOX
---@field max Vec3 BOX

---@class VolumeParams
---@field id VolumeType
---@field params VolumeParamsParams

---https://wiki.hoggitworld.com/view/DCS_func_searchObjects
---Searches a defined volume of 3d space for the specified objects within it and then can run function on each returned object.
---Object category is either a single enum or a table of enums that defines the types of objects that will be searched for.
---Search volume is the defined 3d space that will be searched. See pages for the correct format of each volume type:
---@param objectCategory ObjectCategory -- Enum: Object.Category
---@param searchVolume VolumeParams
---@param functionToCall function<Unit>
---@param data? any
function world.searchObjects(objectCategory, searchVolume, functionToCall, data)
end

---https://wiki.hoggitworld.com/view/DCS_func_getMarkPanels
---Returns a table of mark panels and drawn shapes indexed numerically that are present within the mission. Panel is designed with the mark points in mind, but still returns data for shapes created via markups.
---@return table<MarkPanel> markPanels
function world.getMarkPanels()
end

---https://wiki.hoggitworld.com/view/DCS_func_removeJunk
---Searches the defined area passed to the function to remove craters, object wreckage, and any other debris within the search volume. Will not remove wreckage of scenery objects.
---@param searchVolume VolumeParams
---@return number 
function world.removeJunk(searchVolume)
end

---@class Coalition
---@field side CoalitionEnum
---@field service Service
coalition = {}

---@enum CoalitionEnum
local CoalitionEnum = {
    ALL = -1,
    NEUTRAL = 0,
    RED = 1,
    BLUE = 2
}

coalition.side = {
    NEUTRAL = 0,
    RED = 1,
    BLUE = 2
}

---@enum Service
local Service = {
    ATC = 0,
    AWACS = 1,
    TANKER = 2,
    FAC = 3
}

coalition.service = {
    ATC = 0,
    AWACS = 1,
    TANKER = 2,
    FAC = 3
  }

---https://wiki.hoggitworld.com/view/DCS_func_addGroup
---Dynamically spawns a group of the specified category for the specified country. Group data table is in the same format as created by the mission editor.
---@param countryId integer
---@param groupCategory GroupCategory Enum: Group.Category
---@param groupData table
---@return Group group
function coalition.addGroup(countryId, groupCategory, groupData)
end

---https://wiki.hoggitworld.com/view/DCS_func_addStaticObject
---Dynamically spawns a static object belonging to the specified country into the mission. This function follows the same rules as coalition.addGroup except for the object table not perfectly matching the format of a static object as seen in the mission file.
---@param contryId integer 
---@param static StaticObjectData
---@return StaticObject unknown
function coalition.addStaticObject(contryId, static)
end

---https://wiki.hoggitworld.com/view/DCS_func_getGroups
---Returns a table of group objects belonging to the specified coalition. If the groupCategory enumerator is provided the table will only contain groups that belong to the specified category. If this optional variable is not provided, all group types will be returned. See here for the list of possible group categories.
---@param coalitionId CoalitionEnum Enum: coalition.side
---@param groupCategory? GroupCategory Enum: Group.Category
---@return table<integer, Group> groups
function coalition.getGroups(coalitionId, groupCategory)
end

---https://wiki.hoggitworld.com/view/DCS_func_getStaticObjects
---Returns a table of static objects belonging to the specified coalition.
---@param countryId CoalitionEnum Enum: coalition.side
---@return table<integer, StaticObject> staticObjects
function coalition.getStaticObjects(countryId)
end

---https://wiki.hoggitworld.com/view/DCS_func_getAirbases
---Returns a table of airbase objects belonging to the specified coalition. Objects can be ships, static objects(FARP), or airbases on the map.
---@param coalitionId CoalitionEnum Enum: coalition.side
---@return table<integer, Airbase> airbases
function coalition.getAirbases(coalitionId)
end

---https://wiki.hoggitworld.com/view/DCS_func_getPlayers
---Returns a table of unit objects that are currently occupied by players. Function is useful in multiplayer to easily filter client aircraft from everything else.
---@param coalitionId CoalitionEnum Enum: coalition.side
---@return table<integer, Unit> players
function coalition.getPlayers(coalitionId)
end

---https://wiki.hoggitworld.com/view/DCS_func_getServiceProviders
---Returns a table of unit objects that provide a given service to player controlled aircraft. Services are ATC, AWACS, TANKER, and FAC.
---@param coalitionId CoalitionEnum Enum: coalition.side
---@param service Service Enum: coalition.service
---@return table<integer, Unit> serviceProviders
function coalition.getServiceProviders(coalitionId, service)
end

---@class RefPoint
---@field callsign number
---@field type number
---@field point Vec3

---https://wiki.hoggitworld.com/view/DCS_func_addRefPoint
---Creates a new reference point belonging to the specified coalition. Reference points are used by JTACs.
---@param coalitionId CoalitionEnum Enum: coalition.side
---@param refPoint RefPoint
---@return function what ??
function coalition.addRefPoint(coalitionId, refPoint)
end

---https://wiki.hoggitworld.com/view/DCS_func_getMainRefPoint
---Returns the position of a coalitions "bullseye" as specified in the mission editor.
---@param coalitionId CoalitionEnum Enum: coalition.side
---@return Vec3 point
function coalition.getMainRefPoint(coalitionId)
end

---https://wiki.hoggitworld.com/view/DCS_func_getCountryCoalition
---Returns the enumarator coalitionId that a specified country belongs to.
---@param countryId number
---@return CoalitionEnum coalitionId Enum: coalition.side
function coalition.getCountryCoalition(countryId)
end

---@class Action
local action = {}

---@class Misc
local misc = {}

---@enum SmokeColor
local SmokeColor = {
    Green =  0,
    Red =    1,
    White =  2,
    Orange = 3,
    Blue =   4
}

---https://wiki.hoggitworld.com/view/DCS_func_ctfColorTag
---Creates a smoke plume behind a specified aircraft. When passed 0 for smoke type the plume will be disabled. When triggering the on the same unit with a different color the plume will simply change color.
---@param unitName string
---@param smokeColor SmokeColor Enum: SmokeColor
---@return function why
function action.ctfColorTag(unitName, smokeColor)
end

---https://wiki.hoggitworld.com/view/DCS_func_getUserFlag
---Returns the value of a user flag.
---@param flagNumOrName any
---@return number value
function misc.getUserFlag(flagNumOrName)
end

---https://wiki.hoggitworld.com/view/DCS_func_setUserFlag
---Sets a user flag to the specified value.
---@param flagNumOrName any
---@param userFlagValue any boolean or number
---@return function itReturnsAFunction ?
function action.setUserFlag(flagNumOrName, userFlagValue)
end

---@class TriggerZone
---@field point Vec3
---@field radius number

---https://wiki.hoggitworld.com/view/DCS_func_getZone
---Returns a trigger zone table of a given name.
---@param zoneName string
---@return TriggerZone zone
function misc.getZone(zoneName)
end

---https://wiki.hoggitworld.com/view/DCS_func_explosion
---Creates an explosion at a given point at the specified power.
---@param point Vec3
---@param power number
---@return function 
function action.explosion(point, power)
end

---https://wiki.hoggitworld.com/view/DCS_func_smoke
---Creates colored smoke marker at a given point. Smoke uses trigger.smokeColor enum
---@param point Vec3
---@param color SmokeColor Enum: trigger.SmokeColor
---@return function
function action.smoke(point, color)
end

---@enum BigSmoke
local BigSmoke = {
    SMALL_SMOKE_AND_FIRE = 1,
    MEDIUM_SMOKE_AND_FIRE = 2,
    LARGE_SMOKE_AND_FIRE = 3,
    HUGE_SMOKE_AND_FIRE = 4,
    SMALL_SMOKE = 5,
    MEDIUM_SMOKE = 6,
    LARGE_SMOKE = 7,
    HUGE_SMOKE = 8
}

---https://wiki.hoggitworld.com/view/DCS_func_effectSmokeBig
---Creates a large smoke effect on a vec3 point of a specified type and density.
---@param point Vec3
---@param type BigSmoke
---@param density number 0 to 1
---@param name? string
---@return function
function action.effectSmokeBig(point, type, density, name)
end

---https://wiki.hoggitworld.com/view/DCS_func_effectSmokeStop
---Stops a big smoke effect of the passed name. Used in conjunction with trigger.action.effectSmokeBig
---@param name string
---@return function
function action.effectSmokeStop(name)
end

---https://wiki.hoggitworld.com/view/DCS_func_illuminationBomb
---Creates an illumination bomb at the specified point. y variable defines the altitude at which the bomb will appear at. The illumination bomb will burn for 300 seconds (5 minutes). Additionally the bomb will fall toward the ground, so a minimum altitude is required to get the full illumination time. The power is a value between 1 and 1000000.
---@param point Vec3
---@param power number
---@return function
function action.illuminationBomb(point, power)
end

---@enum FlareColor
local flareColor = {
    GREEN = 0,
    RED = 1,
    WHITE = 2,
    YELLOW = 3
}

---https://wiki.hoggitworld.com/view/DCS_func_signalFlare
---Creates a signal flare at the given point in the specified color. The flare will be launched in the direction of the azimuth variable.
---@param point Vec3
---@param color FlareColor Enum: trigger.FlareColor
---@param azimuth number
---@return function
function action.signalFlare(point, color, azimuth)
end

---@enum RadioModulation
local radioModulation = {
    AM = 0,
    FM = 1
}

---https://wiki.hoggitworld.com/view/DCS_func_radioTransmission
---Transmits an audio file to be broadcast over a specific frequency eneminating from the specified point.
---@param fileName string
---@param point Vec3
---@param modulation RadioModulation
---@param loop boolean
---@param freq number Frequency is in Hz and requires 9 digits.
---@param power number Power is measured in Watts
---@param name? string
---@return function
function action.radioTransmission(fileName, point, modulation, loop, freq, power, name)
end

---https://wiki.hoggitworld.com/view/DCS_func_stopRadioTransmission
---Stops a radio transmission of the passed name. Transmission must be named in the trigger.action.radioTransmission it was sent from.
---@param name string
---@return function
function action.stopRadioTransmission(name)
end

---https://wiki.hoggitworld.com/view/DCS_func_setUnitInternalCargo
---Sets the internal cargo for the specified unit at the specified mass. Overrides any previously set value. Can be used in conjunction with troop transport to simulate cargo being added to the aircraft. Can be used on any unit object, however it only will impact airplanes and helicopters. Mass is defined in kilograms.
---@param unitName string
---@param mass number
---@return function
function action.setUnitInternalCargo(unitName, mass)
end

---https://wiki.hoggitworld.com/view/DCS_func_outSound
---Plays a sound file to all players. The sound file must be placed inside of the miz file in order to be played.
---@param fileName string
---@return function
function action.outSound(fileName)
end

---https://wiki.hoggitworld.com/view/DCS_func_outSoundForCoalition
---Plays a sound file to all players on the specified coalition. The sound file must be placed inside of the miz file in order to be played.
---@param coalitionId CoalitionEnum Enum: coalition.side
---@param fileName string
---@return function
function action.outSoundForCoalition(coalitionId, fileName)
end

---https://wiki.hoggitworld.com/view/DCS_func_outSoundForCountry
---Plays a sound file to all players on the specified country. The sound file must be placed inside of the miz file in order to be played.
---@param countryId number
---@param fileName string
---@return function
function action.outSoundForCountry(countryId, fileName)
end

---https://wiki.hoggitworld.com/view/DCS_func_outSoundForGroup
---Plays a sound file to all players in the specified group. Group is specified by their groupId. The sound file must be placed inside of the miz file in order to be played.
---@param groupId number
---@param fileName string
---@return function
function action.outSoundForGroup(groupId, fileName)
end

---https://wiki.hoggitworld.com/view/DCS_func_outSoundForUnit
---Plays a sound file to all players in the specified unit. Unit is specified by the corresponding UnitId The sound file must be placed inside of the miz file in order to be played.
---@param unitId number
---@param fileName string
---@return function
function action.outSoundForUnit(unitId, fileName)
end

---https://wiki.hoggitworld.com/view/DCS_func_outText
---Displays the passed string of text for the specified time to all players. Boolean clearview defines whether or not to use the old message display format. The old message display overwrites existing messages and is good for displaying anything that must be updated at a high rate like lap times.
---@param text string
---@param time number
---@param clearView? boolean
---@return function
function action.outText(text, time, clearView)
end

---https://wiki.hoggitworld.com/view/DCS_func_outTextForCoalition
---Displays the passed string of text for the specified time to all players belonging to the specified coalition. Boolean clearview defines whether or not to use the old message display format. The old message display overwrites existing messages and is good for displaying anything that must be updated at a high rate like lap times.
---@param coalitionId CoalitionEnum Enum: coalition.side
---@param text string
---@param time number
---@param clearView? boolean
---@return function
function action.outTextForCoalition(coalitionId, text, time, clearView)
end

---https://wiki.hoggitworld.com/view/DCS_func_outTextForCountry
---Displays the passed string of text for the specified time to all players belonging to the specified country. Boolean clearview defines whether or not to use the old message display format. The old message display overwrites existing messages and is good for displaying anything that must be updated at a high rate like lap times.
---@param countryId number
---@param text string
---@param time number
---@param clearView? boolean
---@return function
function action.outTextForCountry(countryId, text, time, clearView)
end

---https://wiki.hoggitworld.com/view/DCS_func_outTextForGroup
---Displays the passed string of text for the specified time to all players in the specified group. The group is defined by its groupId. Boolean clearview defines whether or not to use the old message display format. The old message display overwrites existing messages and is good for displaying anything that must be updated at a high rate like lap times.
---@param groupId number
---@param text string
---@param time number
---@param clearView? boolean
---@return function
function action.outTextForGroup(groupId, text, time, clearView)
end

---https://wiki.hoggitworld.com/view/DCS_func_outTextForUnit
---Displays the passed string of text for the specified time to all players in the specified unit. The unit is defined by its unitId.
---Boolean clearview defines whether or not to use the old message display format. The old message display overwrites existing messages and is good for displaying anything that must be updated at a high rate like lap times.
---@param unitId number
---@param text string
---@param time number
---@param clearView? boolean
---@return function
function action.outTextForUnit(unitId, text, time, clearView)
end

---https://wiki.hoggitworld.com/view/DCS_func_addOtherCommand
---Adds a command to the "F10 Other" radio menu allowing players to call commands and set flags within the mission. Command is added for both teams. The string name is the text that will be displayed in the F10 Other menu and is also used in the function to remove the command from the menu.
---@param name string
---@param userFlagName string
---@param userFlagValue number
---@return function
function action.addOtherCommand(name, userFlagName, userFlagValue)
end

---https://wiki.hoggitworld.com/view/DCS_func_removeOtherCommand
---Removes the command that matches the specified name input variable from the "F10 Other" radio menu.
---@param name string
---@return function
function action.removeOtherCommand(name)
end

---https://wiki.hoggitworld.com/view/DCS_func_addOtherCommandForCoalition
---Adds a command to the "F10 Other" radio menu allowing players to call commands and set flags within the mission. Command is added for all players belonging to the specified coalition. The string name is the text that will be displayed in the F10 Other menu and is also used in the function to remove the command from the menu.
---@param coalitionId CoalitionEnum Enum: coalition.side
---@param name string
---@param userFlagName string
---@param userFlagValue number
---@return function
function action.addOtherCommandForCoalition(coalitionId, name, userFlagName, userFlagValue)
end

---https://wiki.hoggitworld.com/view/DCS_func_removeOtherCommandForCoalition
---Removes the command that matches the specified name input variable from the "F10 Other" radio menu if the command was added for coalition.
---@param coalitionId CoalitionEnum Enum: coalition.side
---@param name string
---@return function
function action.removeOtherCommandForCoalition(coalitionId, name)
end

---https://wiki.hoggitworld.com/view/DCS_func_addOtherCommandForGroup
---Adds a command to the "F10 Other" radio menu allowing players to call commands and set flags within the mission. Command is added for a specific group designated by its groupId. The string name is the text that will be displayed in the F10 Other menu and is also used in the function to remove the command from the menu.
---@param groupId number
---@param name string
---@param userFlagName string
---@param userFlagValue number
---@return function
function action.addOtherCommandForGroup(groupId, name, userFlagName, userFlagValue)
end

---https://wiki.hoggitworld.com/view/DCS_func_removeOtherCommandForGroup
---Removes the command that matches the specified name input variable from the "F10 Other" radio menu if the command exists for the specified group.
---@param groupId number
---@param name string
---@return function
function action.removeOtherCommandForGroup(groupId, name)
end

---https://wiki.hoggitworld.com/view/DCS_func_markToAll
---Adds a mark point to all on the F10 map with attached text.
---2.5 added the two new variables of readOnly and message. Read only if true will make it so users cannot remove the mark. Message is a message that is displayed when a mark is added. Set to for no message to be added.
---@param id number
---@param text string
---@param point Vec3
---@param readOnly? boolean
---@param message? string
function action.markToAll(id, text, point, readOnly, message)
end

---https://wiki.hoggitworld.com/view/DCS_func_markToCoalition
---Adds a mark point to a coalition on the F10 map with attached text.
---2.5 added the two new variables of readOnly and message. Read only if true will make it so users cannot remove the mark. Message is a message that is displayed when a mark is added. Set to for no message to be added.
---@param id number
---@param text string
---@param point Vec3
---@param coalitionId CoalitionEnum Enum: coalition.side
---@param readOnly? boolean
---@param message? string
function action.markToCoalition(id, text, point, coalitionId, readOnly, message)
end

---https://wiki.hoggitworld.com/view/DCS_func_markToGroup
---Adds a mark point to a group on the F10 map with attached text.
---2.5 added the two new variables of readOnly and message. Read only if true will make it so users cannot remove the mark. Message is a message that is displayed when a mark is added. Set to for no message to be added.
---@param id number
---@param text string
---@param point Vec3
---@param groupId number
---@param readOnly? boolean
---@param message? string
function action.markToGroup(id, text, point, groupId, readOnly, message)
end

---https://wiki.hoggitworld.com/view/DCS_func_removeMark
---Removes a mark panel from the f10 map
---@param id number
function action.removeMark(id)
end

---@enum ShapeType
local ShapeType = {
    LINE = 1,
    CIRCLE = 2,
    RECT = 3,
    ARROW = 4,
    TEXT = 5,
    QUAD = 6,
    FREEFORM = 7
}

---@enum LineType
local LineType = {
    NO_LINE = 0,
    SOLID = 1,
    DASHED = 2,
    DOTTED = 3,
    DOT_DASH = 4,
    LONG_DASH = 5,
    TWO_DASH = 6
}

---https://wiki.hoggitworld.com/view/DCS_func_markupToAll
---Creates the defined shape on the F10 map. Uses the same definitions as the specific functions to create different shapes with the only difference being the first parameter is used to define the shape. This function does have an additional type of shape of "freeform" which allows you to create an 3+ vertices shape in any format you wish.
---@param shape ShapeType
---@param coalitionId CoalitionEnum Enum: coalition.side, allows -1 for all
---@param id number Id MUST be unique and is shared with the ids used with mark panels. Likewise trigger.action.removeMark is used to remove shapes created.
---@param point1 Vec3 When using "Freeform" add extra vec3 points after this parameter e.g markupToAll(..., id, point1, point2, point3, point4, color, ...)
---@param color table<integer, number> rgba 0-1
---@param fillColor table<integer, number> rgba 0-1
---@param lineType LineType 
---@param readOnly? boolean
---@param message? string
---@return function
function action.markupToAll(shape, coalitionId, id, point1, color, fillColor, lineType, readOnly, message)
end

---https://wiki.hoggitworld.com/view/DCS_func_lineToAll
---Creates a line on the F10 map from one point to another.
---@param coalitionId CoalitionEnum Enum: coalition.side, allows -1 for all
---@param id number
---@param startPoint Vec3
---@param endPoint Vec3
---@param color table<integer, number> rgba 0-1
---@param lineType LineType
---@param readOnly? boolean
---@param message? string
---@return function
function action.lineToAll(coalitionId, id, startPoint, endPoint, color, lineType, readOnly, message)
end

---https://wiki.hoggitworld.com/view/DCS_func_circleToAll
---Creates a circle on the map with a given radius, color, fill color, and outline.
---@param coalitionId CoalitionEnum Enum: coalition.side, allows -1 for all
---@param id number
---@param center Vec3
---@param radius number
---@param color table<integer, number> rgba 0-1
---@param fillColor table<integer, number> rgba 0-1
---@param lineType LineType
---@param readOnly? boolean
---@param message? string
---@return function
function action.circleToAll(coalitionId, id, center, radius, color, fillColor, lineType, readOnly, message)
end

---https://wiki.hoggitworld.com/view/DCS_func_rectToAll
---Creates a rectangle on the map from the startpoint in one corner to the endPoint in the opposite corner.
---@param coalitionId CoalitionEnum Enum: coalition.side, allows -1 for all
---@param id number
---@param startPoint Vec3
---@param endPoint Vec3
---@param color table<integer, number> rgba 0-1
---@param fillColor table<integer, number> rgba 0-1
---@param lineType LineType
---@param readOnly? boolean
---@param message? string
---@return function
function action.rectToAll(coalitionId, id, startPoint, endPoint, color, fillColor, lineType, readOnly, message)
end

---https://wiki.hoggitworld.com/view/DCS_func_quadToAll
---Creates a shape defined by the 4 points on the F10 map.
---@param coalitionId CoalitionEnum Enum: coalition.side, allows -1 for all
---@param id number
---@param point1 Vec3
---@param point2 Vec3
---@param point3 Vec3
---@param point4 Vec3
---@param color table<integer, number> rgba 0-1
---@param fillColor table<integer, number> rgba 0-1
---@param lineType LineType
---@param readOnly? boolean
---@param message? string
---@return function
function action.quadToAll(coalitionId, id, point1, point2, point3, point4, color, fillColor, lineType, readOnly, message)
end

---https://wiki.hoggitworld.com/view/DCS_func_textToAll
---Creates a text imposed on the map at a given point. Text scales with the map.
---@param coalitionId CoalitionEnum Enum: coalition.side, allows -1 for all
---@param id number
---@param point Vec3
---@param color table<integer, number> rgba 0-1
---@param fillColor table<integer, number> rgba 0-1
---@param fontSize number
---@param readOnly boolean
---@param text string
---@return function
function action.textToAll(coalitionId, id, point, color, fillColor, fontSize, readOnly, text)
end

---https://wiki.hoggitworld.com/view/DCS_func_arrowToAll
---Creates an arrow from the startPoint to the endPoint on the F10 map. The arrow will be "pointing at" the startPoint. There is no control over other dimensions of the arrow.
---@param coalitionId CoalitionEnum Enum: coalition.side, allows -1 for all
---@param id number
---@param startPoint Vec3
---@param endPoint Vec3
---@param color table<integer, number> rgba 0-1
---@param fillColor table<integer, number> rgba 0-1
---@param lineType LineType
---@param readOnly? boolean
---@param message? string
---@return function
function action.arrowToAll(coalitionId, id, startPoint, endPoint, color, fillColor, lineType, readOnly, message)
end

---https://wiki.hoggitworld.com/view/DCS_func_setMarkupRadius
---Updates the radius of the specified mark to be the new value. If the id of the passed mark is not a circle then nothing will happen.
---@param id number
---@param radius number
---@return function
function action.setMarkupRadius(id, radius)
end

---https://wiki.hoggitworld.com/view/DCS_func_setMarkupText
---Updates the text value of the passed mark to the passed text value. If the id of the passed mark does not have any text then nothing will happen.
---@param id number
---@param text string
---@return function
function action.setMarkupText(id, text)
end

---https://wiki.hoggitworld.com/view/DCS_func_setMarkupFontSize
---Updates the font size of the specified mark to be the new value. If the id of the passed mark does not have text then nothing will happen.
---@param id number
---@param fontSize number
---@return function
function action.setMarkupFontSize(id, fontSize)
end

---https://wiki.hoggitworld.com/view/DCS_func_setMarkupColor
---Updates the color of the specified mark to be the new value.
---@param id number
---@param color table<integer, number> rgba 0-1
---@return function
function action.setMarkupColor(id, color)
end

---https://wiki.hoggitworld.com/view/DCS_func_setMarkupColorFill
---Updates the colorfill of the specified mark to be the new value.
---@param id number
---@param color table<integer, number> rgba 0-1
---@return function
---@return function
function action.setMarkupColorFill(id, color)
end

---https://wiki.hoggitworld.com/view/DCS_func_setMarkupTypeLine
---@param id number
---@param lineType LineType
---@return function
function action.setMarkupTypeLine(id, lineType)
end

---https://wiki.hoggitworld.com/view/DCS_func_setMarkupPositionEnd
---Updates the position of a mark that was defined at the last point given to create it. Can be used to "move" an existing mark from one place to the next without deleting it and creating a new one.
---@param id number
---@param point Vec3
---@return function
function action.setMarkupPositionEnd(id, point)
end

---https://wiki.hoggitworld.com/view/DCS_func_setMarkupPositionStart
---Updates the position of a mark that was defined at the first point given to create it. Can be used to "move" an existing mark from one place to the next without deleting it and creating a new one.
---@param id number
---@param point Vec3
---@return function
function action.setMarkupPositionStart(id, point)
end

---https://wiki.hoggitworld.com/view/DCS_func_setAITask
---Sets the task of the specified index to be the one and only active task.
---@param group Group
---@param taskIndex number
---@return function
function action.setAITask(group, taskIndex)
end

---https://wiki.hoggitworld.com/view/DCS_func_pushAITask
---Pushes the task of the specified index to the front of the tasking queue.
---@param group Group
---@param taskIndex number
---@return function
function action.pushAITask(group, taskIndex)
end

---https://wiki.hoggitworld.com/view/DCS_func_activateGroup
---Activates the specified group if it is setup for "late activation." Calls the Group.activate function.
---@param group Group
---@return function
function action.activateGroup(group)
end

---https://wiki.hoggitworld.com/view/DCS_func_deactivateGroup
---Deactivates the specified group. Calls the Group.destroy function.
---@param group Group
---@return function
function action.deactivateGroup(group)
end

function action.activateIguana()
end
function action.deactivateIguana()
end

---https://wiki.hoggitworld.com/view/DCS_func_setGroupAIOn
---Turns the specified groups AI on. Calls the Group.getController(setOnOff(true)) function.
---@param group Group
---@return function
function action.setGroupAIOn(group)
end

---https://wiki.hoggitworld.com/view/DCS_func_setGroupAIOff
---Turns the specified groups AI off. Calls the Group.getController(setOnOff(false)) function.
---@param group Group
---@return function
function action.setGroupAIOff(group)
end

---https://wiki.hoggitworld.com/view/DCS_func_groupStopMoving
---Orders the specified group to stop moving. Calls Group.getController(setCommand()) function and sets the stopRoute command to true.
---@param group Group
---@return function
function action.groupStopMoving(group)
end

---https://wiki.hoggitworld.com/view/DCS_func_groupContinueMoving
---Orders the specified group to resume moving. Calls Group.getController(setCommand()) function and sets the stopRoute command to false.
---@param group Group
---@return function
function action.groupContinueMoving(group)
end

---@class Trigger
---@field action Action
---@field misc Misc
---@field smokeColor SmokeColor
---@field flareColor FlareColor
trigger = {}
trigger.action = {}
trigger.misc = {}

trigger.smokeColor = {
    Green =  0,
    Red =    1,
    White =  2,
    Orange = 3,
    Blue =   4
}

trigger.flareColor = {
    Green = 0,
    Red = 1,
    White = 2,
    Yellow = 3
}

---https://wiki.hoggitworld.com/view/DCS_singleton_coord
---The coord singleton contains functions used to convert coordinates between the game's XYZ, Longitude and Latitude, and the MGRS coordinate systems.
---@class Coord
coord = {}

---https://wiki.hoggitworld.com/view/DCS_func_LLtoLO
---Returns a point from latitude and longitude in the vec3 format.
---@param lat number
---@param lon number
---@param alt? number
---@return Vec3 point
function coord.LLtoLO(lat, lon, alt)
end

---https://wiki.hoggitworld.com/view/DCS_func_LOtoLL
---Returns multiple values of a given vec3 point in latitude, longitude, and altitude
---@param point Vec3
---@return number lat, number lon, number alt
function coord.LOtoLL(point)
end

---@class MGRS
---@field UTMZone string
---@field MGRSDigraph string
---@field Easting number
---@field Northing number

---https://wiki.hoggitworld.com/view/DCS_func_LLtoMGRS
---Returns an MGRS table from the latitude and longitude coordinates provided. Note that in order to get the MGRS coordinate from a vec3 you must first use coord.LOtoLL on it.
---@param lat number
---@param lon number
---@return MGRS mgrs
function coord.LLtoMGRS(lat, lon)
end

---https://wiki.hoggitworld.com/view/DCS_func_MGRStoLL
---Returns multiple values of a given in MGRS coordinates and converts it to latitude, longitude, and altitude
---@param mgrs MGRS
---@return number lat, number lon, number alt
function coord.MGRStoLL(mgrs)
end


---@class MissionCommands
---https://wiki.hoggitworld.com/view/DCS_singleton_missionCommands
---The missionCommands singleton allows for greater access and flexibility of use for the F10 Other radio menu. Added commands can contain sub-menus and directly call lua functions
missionCommands = {}

---https://wiki.hoggitworld.com/view/DCS_func_addCommand
---Adds a command to the "F10 Other" radio menu allowing players to run specified scripting functions. Command is added for both teams. The string name is the text that will be displayed in the F10 Other menu and is also used in the function to remove the command from the menu.
---@param name string
---@param path? table [1]rootFolder [2]subfolder
---@param functionToCall function
---@param args? any
---@return table<integer, string> pathAndCommandName [1]rootFolder, [2]subFolder, [3]commandName

---https://wiki.hoggitworld.com/view/DCS_func_addSubMenu
---Creates a submenu of a specified name for all players. Can be used to create nested sub menues. If the path is not specified, submenu is added to the root menu.
---@param name string
---@param path? table [1]rootFolder [2]subfolder
---@return table<integer, string> pathAndCommandName [1]rootFolder, [2]subFolder [3]newFolder
function missionCommands.addSubMenu(name, path)
end

---https://wiki.hoggitworld.com/view/DCS_func_removeItem
---Removes the item of the specified path from the F10 radio menu for all. If the value is nil all items will be removed from the radio menu. If the path given is a submenu then all items nested within will be removed.
---@param path table [1]rootFolder [2]subfolder
function missionCommands.removeItem(path)
end

---https://wiki.hoggitworld.com/view/DCS_func_addCommandForCoalition
---Adds a command to the "F10 Other" radio menu allowing players to run specified scripting functions. Command is added for the specified coalition. The string name is the text that will be displayed in the F10 Other menu and is also used in the function to remove the command from the menu.
---@param coalitionId CoalitionEnum Enum: coalition.side
---@param name string
---@param path? table [1]rootFolder [2]subfolder
---@param functionToCall function
---@param args? any
---@return table<integer, string> pathAndCommandName [1]rootFolder, [2]subFolder, [3]commandName
function missionCommands.addCommandForCoalition(coalitionId, name, path, functionToCall, args)
end

---https://wiki.hoggitworld.com/view/DCS_func_addSubMenuForCoalition
---Creates a submenu of a specified name for the specified coalition. Can be used to create nested sub menues. If the path is not specified, submenu is added to the root menu.
---@param coalitionId CoalitionEnum Enum: coalition.side
---@param name string
---@param path? table [1]rootFolder [2]subfolder
---@return table<integer, string> pathAndCommandName [1]rootFolder, [2]subFolder [3]newFolder
function missionCommands.addSubMenuForCoalition(coalitionId, name, path)
end

---https://wiki.hoggitworld.com/view/DCS_func_removeItemForCoalition
---Removes the item of the specified path from the F10 radio menu for the specified coalition. If the value is nil all items will be removed from the radio menu.
---@param coalitionId CoalitionEnum Enum: coalition.side
---@param path table [1]rootFolder [2]subfolder
---@return function
function missionCommands.removeItemForCoalition(coalitionId, path)
end

---https://wiki.hoggitworld.com/view/DCS_func_addCommandForGroup
---Path is an optional value that defines whether or not the command will be in a named submenu.
---@param groupId number
---@param name string
---@param path? table [1]rootFolder [2]subfolder
---@param functionToCall function
---@param args? any
---@return table<integer, string> pathAndCommandName [1]rootFolder, [2]subFolder, [3]commandName
function missionCommands.addCommandForGroup(groupId, name, path, functionToCall, args)
end

---https://wiki.hoggitworld.com/view/DCS_func_addSubMenuForGroup
---Creates a submenu of a specified name for the specified group. Can be used to create nested sub menues. If the path is not specified, submenu is added to the root menu.
---@param groupId number
---@param name string
---@param path? table [1]rootFolder [2]subfolder
---@return table<integer, string> pathAndCommandName [1]rootFolder, [2]subFolder [3]newFolder
function missionCommands.addSubMenuForGroup(groupId, name, path)
end

---https://wiki.hoggitworld.com/view/DCS_func_removeItemForGroup
---Removes the item of the specified path from the F10 radio menu for the specified group. If the value is nil all items will be removed from the radio menu.
---@param groupId number
---@param path table [1]rootFolder [2]subfolder
---@return function
function missionCommands.removeItemForGroup(groupId, path)
end

---https://wiki.hoggitworld.com/view/DCS_singleton_voiceChat
---The voice chat singleton is a means of creating customized voice chat rooms for players to interact with each other in multiplayer.
---@class VoiceChat
VoiceChat = {}

---@enum VoiceChatSide
local VoiceChatSide = {
    NEUTRAL = 0,
    RED = 1,
    BLUE = 2,
    ALL = 3
}

---@enum RoomType
local RoomType = {
    PERSISTENT = 0,
    MULTICREW = 1,
    MANAGEABLE = 2
}

VoiceChat.Side = {
    NEUTRAL = 0,
    RED = 1,
    BLUE = 2,
    ALL = 3
 }

 VoiceChat.RoomType= {
    PERSISTENT = 0,
    MULTICREW = 1,
    MANAGEABLE = 2
 }

 ---https://wiki.hoggitworld.com/view/DCS_func_createRoom
 ---Creates a VoiceChat room for players to join and interact with each other in a multiplayer mission.
---@param name string
---@param side VoiceChatSide Enum: VoiceChat.Side
---@param roomType? RoomType Enum: VoiceChat.RoomType
function VoiceChat.createRoom(name, side, roomType)
end

---@class net
---https://wiki.hoggitworld.com/view/DCS_singleton_net
---The net singleton are a number of functions from the network API that work in the mission scripting environment. Notably for mission scripting purposes there is now a way to send chat, check if players are in Combined Arms slots, kick people from the server, and move players to certain slots.
net = {
    PS_PING = 0,
    PS_CRASH = 1,
    PS_CAR = 2,
    PS_PLANE = 3,
    PS_SHIP = 4,
    PS_SCORE = 5,
    PS_LAND = 6,
    PS_EJECT = 7
}

---https://wiki.hoggitworld.com/view/DCS_func_send_chat
---Sends a chat message.
---@param message string
---@param all? boolean
function net.send_chat(message, all)
end

---https://wiki.hoggitworld.com/view/DCS_func_send_chat_to
---Sends a chat message to the player with the passed id. If the optional from Id is set then the player will appear to receive a message from that player.
---@param message string
---@param toId number
---@param fromId? number
function net.send_chat_to(message, toId, fromId)
end

---https://wiki.hoggitworld.com/view/DCS_func_get_player_list
---Returns a table of all players in the mission.
---@return table<integer, any> playerList return type not documentend
function net.get_player_list()
end

---https://wiki.hoggitworld.com/view/DCS_func_get_my_player_id
---Returns the playerID of the local player. Always returns 1 for server.
---@returns number playerId
function net.get_my_player_id()
end

---https://wiki.hoggitworld.com/view/DCS_func_get_server_id
---Returns the playerID of the server. Currently always 1.
---@return number serverId
function net.get_server_id()
end

---@class PlayerInfo
---@field id number
---@field name string
---@field side CoalitionEnum
---@field slot number
---@field ping number
---@field ipaddr string SERVER ONLY
---@field ucid string SERVER ONLY

---https://wiki.hoggitworld.com/view/DCS_func_get_player_info
---@param playerId number
---@param attribue? string
---@return PlayerInfo playerInfo or as single value if attribute is passed
function net.get_player_info(playerId, attribue)
end

---https://wiki.hoggitworld.com/view/DCS_func_kick
---Kicks a player from the server. Can display a message to the user.
---@param playerId number
---@param message? string
---@return boolean
function net.kick(playerId, message)
end

---https://wiki.hoggitworld.com/view/DCS_func_get_stat
---Returns a statistic from a given player.
---@param playerId number
---@param stat number Enum: net.PS_*
---@return number statValue
function net.get_stat(playerId, stat)
end

---https://wiki.hoggitworld.com/view/DCS_func_get_name
---Returns the name of a given player. Is the same as net.get_player_info(playerID, 'name')
---@param playerId number
---@return string playerName
function net.get_name(playerId)
end

---https://wiki.hoggitworld.com/view/DCS_func_get_slot
---Returns the sideId and slotId of a given player. Is the same as net.get_player_info(playerID, 'side') and net.get_player_info(playerID, 'slot')
---@param playerId number
---@return CoalitionEnum side, number slot
function net.get_slot(playerId)
end

---https://wiki.hoggitworld.com/view/DCS_func_force_player_slot
---Forces the player to occupy the set slot.
---@param playerId number
---@param coalitionId CoalitionEnum
---@param slotId number
function net.force_player_slot(playerId, coalitionId, slotId)
end

---https://wiki.hoggitworld.com/view/DCS_func_lua2json
---Converts a lua value to a JSON string.
---@param value any
---@return string jsonString but it says table?
function net.lua2json(value)
end

---https://wiki.hoggitworld.com/view/DCS_func_json2lua
---Converts a JSON string to a lua value.
---@param jsonString string
---@return any value
function net.json2lua(jsonString)
end

---@enum DoState
local DoState = {
    config = "config", --- the state in which $INSTALL_DIR/Config/main.cfg is executed, as well as $WRITE_DIR/Config/autoexec.cfg
    mission = "mission", --- holds current mission
    export = "export" ---runs $WRITE_DIR/Scripts/Export.lua and the relevant export API
}

---https://wiki.hoggitworld.com/view/DCS_func_dostring_in
---Executes a lua string in a given lua environment in the game.
---@param state DoState Enum: DoState
---@param luaString string
---@return string
function net.dostring_in(state, luaString)
end





