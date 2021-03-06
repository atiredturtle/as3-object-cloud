//
// (BSD License) 100% Open Source see http://en.wikipedia.org/wiki/BSD_licenses
//
// Copyright (c) 2009, Martin Heidegger
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
//
//    * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
//    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
//    * Neither the name of the Martin Heidegger nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
package at.leichtgewicht.cloud.algorithm 
{
	import flash.display.BlendMode;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	
	/**
	 * @author Martin Heidegger
	 */
	public class ShapeOverlapTester extends Sprite 
	{
		// Rectangle to be used for every calculation
		private const HELPER_RECT: Rectangle = new Rectangle();
		
		// Matrix to be used for every calculcation
		private const HELPER_MATRIX: Matrix = new Matrix( 1, 0, 0, 1 );
		
		private const TOP_LEFT: Point = new Point();
		
		private const _size: Rectangle = new Rectangle( );
		private const _tester: BitmapData = new BitmapData( 2880, 2880, false, 0xFFFFFF );

		public function ShapeOverlapTester()
		{
			_tester.lock();
			_size.width = width;
			_size.height = height;
			with( graphics )
			{
				clear();
				beginFill( 0xFFFFFF, 1.0 );
				drawRect( -999999, -999999, 1999999, 1999999 );
				endFill();
			}
		}
		
		public function clear(): void
		{
			var i: int = numChildren;
			while( --i-(-1) )
			{
				removeChild( getChildAt(i) );
			}
		}
		
		public function test( area: Rectangle ): Boolean
		{
			HELPER_MATRIX.tx = -area.x;
			HELPER_MATRIX.ty = -area.y;
			HELPER_RECT.width = area.width;
			HELPER_RECT.height = area.height;
			_tester.draw( this, HELPER_MATRIX, null, BlendMode.DARKEN, HELPER_RECT, false );
			return _tester.threshold( _tester, HELPER_RECT, TOP_LEFT,
											"<=", 0xFF767676, 0xFFFF0000 ) != 0;
		}
		
		public function get bitmap(): BitmapData
		{
			return _tester;
		}
	}
}
