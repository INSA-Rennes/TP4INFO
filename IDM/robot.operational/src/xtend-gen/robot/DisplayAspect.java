package robot;

import fr.inria.triskell.k3.Aspect;
import fr.inria.triskell.k3.OverrideAspectMethod;
import robot.ContextNCX;
import robot.DisplayAspectDisplayAspectProperties;
import robot.NXCCodeGenerator;
import robotG.robot.Display;

@Aspect(className = Display.class)
@SuppressWarnings("all")
public class DisplayAspect extends NXCCodeGenerator {
  @OverrideAspectMethod
  public static StringBuilder generateCode(final Display _self, final ContextNCX ctx) {
    robot.DisplayAspectDisplayAspectContext _instance = robot.DisplayAspectDisplayAspectContext.getInstance();
    				    java.util.Map<robotG.robot.Display,robot.DisplayAspectDisplayAspectProperties> selfProp = _instance.getMap();
    					boolean _containsKey = selfProp.containsKey(_self);
    				    boolean _not = (!_containsKey);
    				    if (_not) {
      						robot.DisplayAspectDisplayAspectProperties prop = new robot.DisplayAspectDisplayAspectProperties();
    				   selfProp.put(_self, prop);
    			    }
    			     _self_ = selfProp.get(_self);
    			        if (_self instanceof robotG.robot.Display){
    			     							return robot.DisplayAspect.privgenerateCode((robotG.robot.Display)_self,ctx);
    			     							} else    if (_self instanceof java.lang.Object){
    			     							return robot.NXCCodeGenerator.privgenerateCode((java.lang.Object)_self,ctx);
    			     							} else 
    			      {
    			       										throw new IllegalArgumentException("Unhandled parameter types: " +
    			     							        java.util.Arrays.<Object>asList(_self).toString());
    			     					    } 
  }
  
  public static DisplayAspectDisplayAspectProperties _self_;
  
  private static StringBuilder super_generateCode(final Display _self, final ContextNCX ctx) {
     return  robot.NXCCodeGenerator.privgenerateCode(_self,ctx);  
  }
  
  protected static StringBuilder privgenerateCode(final Display _self, final ContextNCX ctx) {
    StringBuilder _xblockexpression = null;
    {
      StringBuilder _stringBuilder = new StringBuilder();
      final StringBuilder code = _stringBuilder;
      StringBuilder _append = code.append("TextOut(");
      String _msg = _self.getMsg();
      StringBuilder _append_1 = _append.append(_msg);
      StringBuilder _append_2 = _append_1.append(",");
      int _duration = _self.getDuration();
      StringBuilder _append_3 = _append_2.append(_duration);
      StringBuilder _append_4 = _append_3.append(",");
      int _line = _self.getLine();
      StringBuilder _append_5 = _append_4.append(_line);
      StringBuilder _append_6 = _append_5.append(",");
      int _col = _self.getCol();
      StringBuilder _append_7 = _append_6.append(_col);
      StringBuilder _append_8 = _append_7.append(");\n");
      _xblockexpression = (_append_8);
    }
    return _xblockexpression;
  }
}
