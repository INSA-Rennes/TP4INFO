package robot;

import fr.inria.triskell.k3.Aspect;
import fr.inria.triskell.k3.OverrideAspectMethod;
import org.eclipse.emf.common.util.EList;
import robot.ContextNCX;
import robot.NXCCodeGenerator;
import robot.WhileAspectWhileAspectProperties;
import robotG.flow.Expr;
import robotG.flow.ExprBool;
import robotG.flow.While;

@Aspect(className = While.class)
@SuppressWarnings("all")
public class WhileAspect extends NXCCodeGenerator {
  @OverrideAspectMethod
  public static StringBuilder generateCode(final While _self, final ContextNCX ctx) {
    robot.WhileAspectWhileAspectContext _instance = robot.WhileAspectWhileAspectContext.getInstance();
    				    java.util.Map<robotG.flow.While,robot.WhileAspectWhileAspectProperties> selfProp = _instance.getMap();
    					boolean _containsKey = selfProp.containsKey(_self);
    				    boolean _not = (!_containsKey);
    				    if (_not) {
      						robot.WhileAspectWhileAspectProperties prop = new robot.WhileAspectWhileAspectProperties();
    				   selfProp.put(_self, prop);
    			    }
    			     _self_ = selfProp.get(_self);
    			        if (_self instanceof robotG.flow.While){
    			     							return robot.WhileAspect.privgenerateCode((robotG.flow.While)_self,ctx);
    			     							} else    if (_self instanceof java.lang.Object){
    			     							return robot.NXCCodeGenerator.privgenerateCode((java.lang.Object)_self,ctx);
    			     							} else 
    			      {
    			       										throw new IllegalArgumentException("Unhandled parameter types: " +
    			     							        java.util.Arrays.<Object>asList(_self).toString());
    			     					    } 
  }
  
  public static WhileAspectWhileAspectProperties _self_;
  
  private static StringBuilder super_generateCode(final While _self, final ContextNCX ctx) {
     return  robot.NXCCodeGenerator.privgenerateCode(_self,ctx);  
  }
  
  protected static StringBuilder privgenerateCode(final While _self, final ContextNCX ctx) {
    StringBuilder _xblockexpression = null;
    {
      StringBuilder _stringBuilder = new StringBuilder();
      final StringBuilder code = _stringBuilder;
      StringBuilder _append = code.append("while(");
      ExprBool _condition = _self.getCondition();
      StringBuilder _generateCode = NXCCodeGenerator.generateCode(_condition, ctx);
      StringBuilder _append_1 = _append.append(_generateCode);
      StringBuilder _append_2 = _append_1.append("){\n");
      EList<Expr> _instructions = _self.getInstructions();
      StringBuilder _generateCode_1 = NXCCodeGenerator.generateCode(_instructions, ctx);
      StringBuilder _append_3 = _append_2.append(_generateCode_1);
      StringBuilder _append_4 = _append_3.append("}\n");
      _xblockexpression = (_append_4);
    }
    return _xblockexpression;
  }
}
