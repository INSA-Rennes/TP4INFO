package robot;

import fr.inria.triskell.k3.Aspect;
import org.eclipse.xtext.xbase.lib.InputOutput;
import robot.ContextNCX;
import robot.NXCCodeGeneratorObjectAspectProperties;

@Aspect(className = Object.class)
@SuppressWarnings("all")
public abstract class NXCCodeGenerator {
  public static StringBuilder generateCode(final Object _self, final ContextNCX ctx) {
    robot.NXCCodeGeneratorObjectAspectContext _instance = robot.NXCCodeGeneratorObjectAspectContext.getInstance();
    				    java.util.Map<java.lang.Object,robot.NXCCodeGeneratorObjectAspectProperties> selfProp = _instance.getMap();
    					boolean _containsKey = selfProp.containsKey(_self);
    				    boolean _not = (!_containsKey);
    				    if (_not) {
      						robot.NXCCodeGeneratorObjectAspectProperties prop = new robot.NXCCodeGeneratorObjectAspectProperties();
    				   selfProp.put(_self, prop);
    			    }
    			     _self_ = selfProp.get(_self);
    			        if (_self instanceof robotG.robot.StopEngine){
    			     							return robot.StopEngineAspect.privgenerateCode((robotG.robot.StopEngine)_self,ctx);
    			     							} else    if (_self instanceof robotG.flow.Programme){
    			     							return robot.ProgramUnitAspect.privgenerateCode((robotG.flow.Programme)_self,ctx);
    			     							} else    if (_self instanceof robotG.flow.While){
    			     							return robot.WhileAspect.privgenerateCode((robotG.flow.While)_self,ctx);
    			     							} else    if (_self instanceof robotG.flow.If){
    			     							return robot.IfAspect.privgenerateCode((robotG.flow.If)_self,ctx);
    			     							} else    if (_self instanceof robotG.flow.And){
    			     							return robot.AndAspect.privgenerateCode((robotG.flow.And)_self,ctx);
    			     							} else    if (_self instanceof robotG.flow.Not){
    			     							return robot.NotAspect.privgenerateCode((robotG.flow.Not)_self,ctx);
    			     							} else    if (_self instanceof robotG.flow.Or){
    			     							return robot.OrAspect.privgenerateCode((robotG.flow.Or)_self,ctx);
    			     							} else    if (_self instanceof robotG.flow.StopProgram){
    			     							return robot.StopProgramAspect.privgenerateCode((robotG.flow.StopProgram)_self,ctx);
    			     							} else    if (_self instanceof robotG.robot.Bip){
    			     							return robot.BipAspect.privgenerateCode((robotG.robot.Bip)_self,ctx);
    			     							} else    if (_self instanceof robotG.robot.Display){
    			     							return robot.DisplayAspect.privgenerateCode((robotG.robot.Display)_self,ctx);
    			     							} else    if (_self instanceof robotG.robot.HasTurned){
    			     							return robot.HasTurnedAspect.privgenerateCode((robotG.robot.HasTurned)_self,ctx);
    			     							} else    if (_self instanceof robotG.robot.Move){
    			     							return robot.MoveCmdAspect.privgenerateCode((robotG.robot.Move)_self,ctx);
    			     							} else    if (_self instanceof robotG.robot.Obstacle){
    			     							return robot.ObstacleAspect.privgenerateCode((robotG.robot.Obstacle)_self,ctx);
    			     							} else    if (_self instanceof robotG.robot.SetTurnAngle){
    			     							return robot.SetTurnAngleCmdAspect.privgenerateCode((robotG.robot.SetTurnAngle)_self,ctx);
    			     							} else    if (_self instanceof robotG.robot.Turn){
    			     							return robot.TurnAspect.privgenerateCode((robotG.robot.Turn)_self,ctx);
    			     							} else    if (_self instanceof java.lang.Object){
    			     							return robot.NXCCodeGenerator.privgenerateCode((java.lang.Object)_self,ctx);
    			     							} else 
    			      {
    			       										throw new IllegalArgumentException("Unhandled parameter types: " +
    			     							        java.util.Arrays.<Object>asList(_self).toString());
    			     					    } 
  }
  
  public static NXCCodeGeneratorObjectAspectProperties _self_;
  
  protected static StringBuilder privgenerateCode(final Object _self, final ContextNCX ctx) {
    InputOutput.<Object>println(_self);
    StringBuilder _stringBuilder = new StringBuilder();
    return _stringBuilder;
  }
}
