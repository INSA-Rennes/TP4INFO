package robot;

import com.google.common.collect.Iterables;
import java.util.Collections;
import java.util.Map;
import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.emf.ecore.resource.Resource.Factory.Registry;
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl;
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import robot.ContextNCX;
import robot.NXCCodeGenerator;
import robotG.flow.Programme;
import robotG.robot.RobotPackage;

@SuppressWarnings("all")
public class Main {
  public static void main(final String... args) {
    final Programme program = Main.load("src/resources/robot.xmi");
    ContextNCX _contextNCX = new ContextNCX();
    final ContextNCX ctx = _contextNCX;
    final StringBuilder code = NXCCodeGenerator.generateCode(program, ctx);
    InputOutput.<StringBuilder>println(code);
  }
  
  public static Programme load(final String path) {
    try {
      Programme _xblockexpression = null;
      {
        ResourceSetImpl _resourceSetImpl = new ResourceSetImpl();
        final ResourceSetImpl rs = _resourceSetImpl;
        RobotPackage.eINSTANCE.eClass();
        Map<String,Object> _extensionToFactoryMap = Registry.INSTANCE.getExtensionToFactoryMap();
        XMIResourceFactoryImpl _xMIResourceFactoryImpl = new XMIResourceFactoryImpl();
        _extensionToFactoryMap.put("*", _xMIResourceFactoryImpl);
        URI _createURI = URI.createURI(path);
        final Resource res = rs.getResource(_createURI, true);
        Map<Object,Object> _emptyMap = Collections.<Object, Object>emptyMap();
        res.load(_emptyMap);
        EList<EObject> _contents = res.getContents();
        Iterable<Programme> _filter = Iterables.<Programme>filter(_contents, Programme.class);
        Programme _head = IterableExtensions.<Programme>head(_filter);
        _xblockexpression = (_head);
      }
      return _xblockexpression;
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
}
