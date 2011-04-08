-- 
-- Abstract: Physicsdemo
-- Demonstrates complex body construction by generating 100 random physics objects
--
-- This demo loads physics bodies created with http://www.physicseditor.de
--
-- Code is based on ANSCA's Create demo
-- Sample code is MIT licensed, see http://developer.anscamobile.com/code/license
-- Copyright (C) 2010 ANSCA Inc. All Rights Reserved.

local physics = require("physics")
physics.start()
display.setStatusBar( display.HiddenStatusBar )

-- background shape
local bkg = display.newImage( "bkg_cor.png" )

-- create physical floor shape
local bar = display.newImage("bar.png")
bar.x = 160; bar.y = 430
physics.addBody( bar, "static", { friction=0.5, bounce=0.3 } )

-- create floor shape only for the looks
local bar2 = display.newImage("bar2.png") 
bar2.x = 160; bar2.y = 440

-- load the physics data, scale factor is set to 1.0
local physicsData = (require "shapedefs").physicsData(1.0)

--physics.setDrawMode( "hybrid" )

function newItem()	
	names = {"drink", "hamburger", "hotdog", "icecream", "icecream2", "icecream3"};

	name = names[math.random(6)];

	-- set the graphics 
	obj = display.newImage(name..".png");

	-- set the shape
	physics.addBody( obj, physicsData:get(name))	
	
	-- random start location
	obj.x = 60 + math.random( 160 )
	obj.y = -100
end

local dropCrates = timer.performWithDelay( 500, newItem, 100 )