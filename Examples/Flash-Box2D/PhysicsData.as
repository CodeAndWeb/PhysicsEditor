package
{
	import Box2D.Dynamics.*;
	import Box2D.Collision.*;
	import Box2D.Collision.Shapes.*;
	import Box2D.Common.Math.*;
    import flash.utils.Dictionary;

    public class PhysicsData extends Object
	{
		// ptm ratio
        public var ptm_ratio:Number = 30;
		
		// the physcis data 
		var dict:Dictionary;
		
        //
        // bodytype:
        //  b2_staticBody
        //  b2_kinematicBody
        //  b2_dynamicBody

        public function createBody(name:String, world:b2World, bodyType:uint, userData:*):b2Body
        {
            var fixtures:Array = dict[name];

            var body:b2Body;
            var f:Number;

            // prepare body def
            var bodyDef:b2BodyDef = new b2BodyDef();
            bodyDef.type = bodyType;
            bodyDef.userData = userData;

            // create the body
            body = world.CreateBody(bodyDef);

            // prepare fixtures
            for(f=0; f<fixtures.length; f++)
            {
                var fixture:Array = fixtures[f];

                var fixtureDef:b2FixtureDef = new b2FixtureDef();


                fixtureDef.density=fixture[0];
                fixtureDef.friction=fixture[1];
                fixtureDef.restitution=fixture[2];

                fixtureDef.filter.categoryBits = fixture[3];
                fixtureDef.filter.maskBits = fixture[4];
                fixtureDef.filter.groupIndex = fixture[5];
                fixtureDef.isSensor = fixture[6];

                var p:Number;
                var polygons:Array = fixture[8];
                for(p=0; p<polygons.length; p++)
                {
                    var polygonShape:b2PolygonShape = new b2PolygonShape();
                    polygonShape.SetAsArray(polygons[p], polygons[p].length);
                    fixtureDef.shape=polygonShape;

                    body.CreateFixture(fixtureDef);
                }
            }

            return body;
        }

		
        public function PhysicsData(): void
		{
			dict = new Dictionary();
			

			dict["drink"] = [

										[
											// density, friction, restitution
                                            1, 0.2, 0.2,
                                            // categoryBits, maskBits, groupIndex, isSensor
											1, 65535, 0, false,
											'POLYGON',
											[

                                                [   new b2Vec2(38/ptm_ratio, 61.5/ptm_ratio)  ,  new b2Vec2(33/ptm_ratio, 171.5/ptm_ratio)  ,  new b2Vec2(22/ptm_ratio, 167.5/ptm_ratio)  ,  new b2Vec2(11/ptm_ratio, 71.5/ptm_ratio)  ,  new b2Vec2(14/ptm_ratio, 63.5/ptm_ratio)  ] ,
                                                [   new b2Vec2(77.5/ptm_ratio, 73/ptm_ratio)  ,  new b2Vec2(67.5/ptm_ratio, 161/ptm_ratio)  ,  new b2Vec2(63.5/ptm_ratio, 170/ptm_ratio)  ,  new b2Vec2(33/ptm_ratio, 171.5/ptm_ratio)  ,  new b2Vec2(38/ptm_ratio, 61.5/ptm_ratio)  ,  new b2Vec2(48/ptm_ratio, 60.5/ptm_ratio)  ,  new b2Vec2(76/ptm_ratio, 64.5/ptm_ratio)  ] ,
                                                [   new b2Vec2(10/ptm_ratio, 4.5/ptm_ratio)  ,  new b2Vec2(41.5/ptm_ratio, 29/ptm_ratio)  ,  new b2Vec2(33.5/ptm_ratio, 32/ptm_ratio)  ,  new b2Vec2(7.5/ptm_ratio, 10/ptm_ratio)  ,  new b2Vec2(9/ptm_ratio, 4.5/ptm_ratio)  ] ,
                                                [   new b2Vec2(41.5/ptm_ratio, 29/ptm_ratio)  ,  new b2Vec2(48/ptm_ratio, 60.5/ptm_ratio)  ,  new b2Vec2(39.5/ptm_ratio, 58/ptm_ratio)  ,  new b2Vec2(33.5/ptm_ratio, 32/ptm_ratio)  ] ,
                                                [   new b2Vec2(48/ptm_ratio, 60.5/ptm_ratio)  ,  new b2Vec2(38/ptm_ratio, 61.5/ptm_ratio)  ,  new b2Vec2(39.5/ptm_ratio, 58/ptm_ratio)  ]
											]
										]

									];

			dict["hamburger"] = [

										[
											// density, friction, restitution
                                            2, 0.3, 0.3,
                                            // categoryBits, maskBits, groupIndex, isSensor
											4, 65535, 0, false,
											'POLYGON',
											[

                                                [   new b2Vec2(7.5/ptm_ratio, 21/ptm_ratio)  ,  new b2Vec2(15/ptm_ratio, 13.5/ptm_ratio)  ,  new b2Vec2(29/ptm_ratio, 7.5/ptm_ratio)  ,  new b2Vec2(64/ptm_ratio, 4.5/ptm_ratio)  ,  new b2Vec2(8.5/ptm_ratio, 37/ptm_ratio)  ,  new b2Vec2(3.5/ptm_ratio, 31/ptm_ratio)  ] ,
                                                [   new b2Vec2(77/ptm_ratio, 70.5/ptm_ratio)  ,  new b2Vec2(17/ptm_ratio, 67.5/ptm_ratio)  ,  new b2Vec2(96.5/ptm_ratio, 49/ptm_ratio)  ,  new b2Vec2(99.5/ptm_ratio, 52/ptm_ratio)  ,  new b2Vec2(94.5/ptm_ratio, 66/ptm_ratio)  ] ,
                                                [   new b2Vec2(90/ptm_ratio, 31.5/ptm_ratio)  ,  new b2Vec2(65/ptm_ratio, 4.5/ptm_ratio)  ,  new b2Vec2(81/ptm_ratio, 6.5/ptm_ratio)  ,  new b2Vec2(91/ptm_ratio, 11.5/ptm_ratio)  ,  new b2Vec2(99.5/ptm_ratio, 24/ptm_ratio)  ,  new b2Vec2(98/ptm_ratio, 29.5/ptm_ratio)  ] ,
                                                [   new b2Vec2(8.5/ptm_ratio, 51/ptm_ratio)  ,  new b2Vec2(13.5/ptm_ratio, 60/ptm_ratio)  ,  new b2Vec2(5.5/ptm_ratio, 54/ptm_ratio)  ] ,
                                                [   new b2Vec2(96.5/ptm_ratio, 49/ptm_ratio)  ,  new b2Vec2(17/ptm_ratio, 67.5/ptm_ratio)  ,  new b2Vec2(64/ptm_ratio, 4.5/ptm_ratio)  ,  new b2Vec2(65/ptm_ratio, 4.5/ptm_ratio)  ,  new b2Vec2(90/ptm_ratio, 31.5/ptm_ratio)  ,  new b2Vec2(97.5/ptm_ratio, 41/ptm_ratio)  ] ,
                                                [   new b2Vec2(8.5/ptm_ratio, 37/ptm_ratio)  ,  new b2Vec2(64/ptm_ratio, 4.5/ptm_ratio)  ,  new b2Vec2(13.5/ptm_ratio, 60/ptm_ratio)  ,  new b2Vec2(8.5/ptm_ratio, 51/ptm_ratio)  ] ,
                                                [   new b2Vec2(64/ptm_ratio, 4.5/ptm_ratio)  ,  new b2Vec2(17/ptm_ratio, 67.5/ptm_ratio)  ,  new b2Vec2(13.5/ptm_ratio, 60/ptm_ratio)  ]
											]
										]

									];

			dict["hotdog"] = [

										[
											// density, friction, restitution
                                            2, 0.2, 0.4,
                                            // categoryBits, maskBits, groupIndex, isSensor
											4, 65535, 0, false,
											'POLYGON',
											[

                                                [   new b2Vec2(103.5/ptm_ratio, 8/ptm_ratio)  ,  new b2Vec2(63/ptm_ratio, 61.5/ptm_ratio)  ,  new b2Vec2(33/ptm_ratio, 62.5/ptm_ratio)  ,  new b2Vec2(21/ptm_ratio, 59.5/ptm_ratio)  ,  new b2Vec2(55/ptm_ratio, 13.5/ptm_ratio)  ,  new b2Vec2(92/ptm_ratio, -0.5/ptm_ratio)  ,  new b2Vec2(100/ptm_ratio, 0.5/ptm_ratio)  ] ,
                                                [   new b2Vec2(5.5/ptm_ratio, 31/ptm_ratio)  ,  new b2Vec2(13/ptm_ratio, 20.5/ptm_ratio)  ,  new b2Vec2(55/ptm_ratio, 13.5/ptm_ratio)  ,  new b2Vec2(21/ptm_ratio, 59.5/ptm_ratio)  ,  new b2Vec2(6.5/ptm_ratio, 47/ptm_ratio)  ] ,
                                                [   new b2Vec2(121.5/ptm_ratio, 26/ptm_ratio)  ,  new b2Vec2(115.5/ptm_ratio, 35/ptm_ratio)  ,  new b2Vec2(93/ptm_ratio, 51.5/ptm_ratio)  ,  new b2Vec2(63/ptm_ratio, 61.5/ptm_ratio)  ,  new b2Vec2(103.5/ptm_ratio, 8/ptm_ratio)  ,  new b2Vec2(122.5/ptm_ratio, 18/ptm_ratio)  ]
											]
										]

									];

			dict["icecream"] = [

										[
											// density, friction, restitution
                                            3, 0.2, 0.2,
                                            // categoryBits, maskBits, groupIndex, isSensor
											2, 65535, 0, false,
											'POLYGON',
											[

                                                [   new b2Vec2(122.5/ptm_ratio, 12/ptm_ratio)  ,  new b2Vec2(99/ptm_ratio, 36.5/ptm_ratio)  ,  new b2Vec2(93/ptm_ratio, 35.5/ptm_ratio)  ,  new b2Vec2(110/ptm_ratio, 10.5/ptm_ratio)  ,  new b2Vec2(119/ptm_ratio, 3.5/ptm_ratio)  ,  new b2Vec2(120/ptm_ratio, 3.5/ptm_ratio)  ,  new b2Vec2(123.5/ptm_ratio, 6/ptm_ratio)  ] ,
                                                [   new b2Vec2(63/ptm_ratio, 20.5/ptm_ratio)  ,  new b2Vec2(66.5/ptm_ratio, 26/ptm_ratio)  ,  new b2Vec2(52/ptm_ratio, 27.5/ptm_ratio)  ,  new b2Vec2(55/ptm_ratio, 21.5/ptm_ratio)  ] ,
                                                [   new b2Vec2(102.5/ptm_ratio, 60/ptm_ratio)  ,  new b2Vec2(92.5/ptm_ratio, 71/ptm_ratio)  ,  new b2Vec2(76/ptm_ratio, 81.5/ptm_ratio)  ,  new b2Vec2(34/ptm_ratio, 81.5/ptm_ratio)  ,  new b2Vec2(26/ptm_ratio, 30.5/ptm_ratio)  ,  new b2Vec2(99/ptm_ratio, 36.5/ptm_ratio)  ,  new b2Vec2(105.5/ptm_ratio, 44/ptm_ratio)  ] ,
                                                [   new b2Vec2(67/ptm_ratio, 13.5/ptm_ratio)  ,  new b2Vec2(66.5/ptm_ratio, 26/ptm_ratio)  ,  new b2Vec2(63/ptm_ratio, 20.5/ptm_ratio)  ,  new b2Vec2(64.5/ptm_ratio, 14/ptm_ratio)  ] ,
                                                [   new b2Vec2(70.5/ptm_ratio, 31/ptm_ratio)  ,  new b2Vec2(42/ptm_ratio, 31.5/ptm_ratio)  ,  new b2Vec2(52/ptm_ratio, 27.5/ptm_ratio)  ,  new b2Vec2(66.5/ptm_ratio, 26/ptm_ratio)  ] ,
                                                [   new b2Vec2(7/ptm_ratio, 40.5/ptm_ratio)  ,  new b2Vec2(26/ptm_ratio, 30.5/ptm_ratio)  ,  new b2Vec2(34/ptm_ratio, 81.5/ptm_ratio)  ,  new b2Vec2(12/ptm_ratio, 67.5/ptm_ratio)  ,  new b2Vec2(5/ptm_ratio, 56.5/ptm_ratio)  ,  new b2Vec2(3.5/ptm_ratio, 46/ptm_ratio)  ] ,
                                                [   new b2Vec2(93/ptm_ratio, 35.5/ptm_ratio)  ,  new b2Vec2(42/ptm_ratio, 31.5/ptm_ratio)  ,  new b2Vec2(70.5/ptm_ratio, 31/ptm_ratio)  ] ,
                                                [   new b2Vec2(99/ptm_ratio, 36.5/ptm_ratio)  ,  new b2Vec2(42/ptm_ratio, 31.5/ptm_ratio)  ,  new b2Vec2(93/ptm_ratio, 35.5/ptm_ratio)  ]
											]
										]

									];

			dict["icecream2"] = [

										[
											// density, friction, restitution
                                            1, 0.2, 0.3,
                                            // categoryBits, maskBits, groupIndex, isSensor
											2, 65535, 0, false,
											'POLYGON',
											[

                                                [   new b2Vec2(23/ptm_ratio, 10.5/ptm_ratio)  ,  new b2Vec2(19/ptm_ratio, 72.5/ptm_ratio)  ,  new b2Vec2(10.5/ptm_ratio, 73/ptm_ratio)  ,  new b2Vec2(1.5/ptm_ratio, 67/ptm_ratio)  ,  new b2Vec2(1.5/ptm_ratio, 19/ptm_ratio)  ,  new b2Vec2(13/ptm_ratio, 6.5/ptm_ratio)  ] ,
                                                [   new b2Vec2(29.5/ptm_ratio, 96/ptm_ratio)  ,  new b2Vec2(29.5/ptm_ratio, 72/ptm_ratio)  ,  new b2Vec2(38/ptm_ratio, 72.5/ptm_ratio)  ,  new b2Vec2(38.5/ptm_ratio, 95/ptm_ratio)  ,  new b2Vec2(35/ptm_ratio, 97.5/ptm_ratio)  ] ,
                                                [   new b2Vec2(29.5/ptm_ratio, 72/ptm_ratio)  ,  new b2Vec2(25.5/ptm_ratio, 70/ptm_ratio)  ,  new b2Vec2(31/ptm_ratio, 5.5/ptm_ratio)  ,  new b2Vec2(32/ptm_ratio, 5.5/ptm_ratio)  ,  new b2Vec2(43.5/ptm_ratio, 21/ptm_ratio)  ,  new b2Vec2(43.5/ptm_ratio, 69/ptm_ratio)  ,  new b2Vec2(38/ptm_ratio, 72.5/ptm_ratio)  ] ,
                                                [   new b2Vec2(10.5/ptm_ratio, 73/ptm_ratio)  ,  new b2Vec2(19/ptm_ratio, 72.5/ptm_ratio)  ,  new b2Vec2(17.5/ptm_ratio, 97/ptm_ratio)  ,  new b2Vec2(11/ptm_ratio, 97.5/ptm_ratio)  ] ,
                                                [   new b2Vec2(31/ptm_ratio, 5.5/ptm_ratio)  ,  new b2Vec2(25.5/ptm_ratio, 70/ptm_ratio)  ,  new b2Vec2(19/ptm_ratio, 72.5/ptm_ratio)  ,  new b2Vec2(23/ptm_ratio, 10.5/ptm_ratio)  ]
											]
										]

									];

			dict["icecream3"] = [

										[
											// density, friction, restitution
                                            2, 0.2, 0.4,
                                            // categoryBits, maskBits, groupIndex, isSensor
											2, 65535, 0, false,
											'POLYGON',
											[

                                                [   new b2Vec2(36/ptm_ratio, 18.5/ptm_ratio)  ,  new b2Vec2(26/ptm_ratio, 9.5/ptm_ratio)  ,  new b2Vec2(38/ptm_ratio, 10.5/ptm_ratio)  ] ,
                                                [   new b2Vec2(21/ptm_ratio, 114.5/ptm_ratio)  ,  new b2Vec2(13.5/ptm_ratio, 70/ptm_ratio)  ,  new b2Vec2(25/ptm_ratio, 9.5/ptm_ratio)  ,  new b2Vec2(26/ptm_ratio, 9.5/ptm_ratio)  ,  new b2Vec2(37.5/ptm_ratio, 60/ptm_ratio)  ,  new b2Vec2(27.5/ptm_ratio, 110/ptm_ratio)  ,  new b2Vec2(25.5/ptm_ratio, 114/ptm_ratio)  ] ,
                                                [   new b2Vec2(37.5/ptm_ratio, 60/ptm_ratio)  ,  new b2Vec2(26/ptm_ratio, 9.5/ptm_ratio)  ,  new b2Vec2(36/ptm_ratio, 18.5/ptm_ratio)  ,  new b2Vec2(43.5/ptm_ratio, 29/ptm_ratio)  ,  new b2Vec2(47.5/ptm_ratio, 43/ptm_ratio)  ] ,
                                                [   new b2Vec2(1.5/ptm_ratio, 31/ptm_ratio)  ,  new b2Vec2(6.5/ptm_ratio, 22/ptm_ratio)  ,  new b2Vec2(25/ptm_ratio, 9.5/ptm_ratio)  ,  new b2Vec2(5.5/ptm_ratio, 49/ptm_ratio)  ,  new b2Vec2(1.5/ptm_ratio, 47/ptm_ratio)  ] ,
                                                [   new b2Vec2(25/ptm_ratio, 9.5/ptm_ratio)  ,  new b2Vec2(13.5/ptm_ratio, 70/ptm_ratio)  ,  new b2Vec2(5.5/ptm_ratio, 49/ptm_ratio)  ]
											]
										]

									];

		}
	}
}
