// ActionScript file
package controls
{
   import mx.controls.sliderClasses.SliderThumb;
   import mx.core.mx_internal;
   use namespace mx_internal;
   
   public class FixedSliderThumb extends SliderThumb
   {
      override protected function measure():void
      {
         super.measure();
         measuredWidth = 30;//currentSkin.measuredWidth;
         measuredHeight = 30;//currentSkin.measuredHeight;
      }
   }
}
