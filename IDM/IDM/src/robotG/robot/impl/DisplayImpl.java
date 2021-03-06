/**
 */
package robotG.robot.impl;

import org.eclipse.emf.common.notify.Notification;

import org.eclipse.emf.ecore.EClass;

import org.eclipse.emf.ecore.impl.ENotificationImpl;

import robotG.robot.Display;
import robotG.robot.RobotPackage;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model object '<em><b>Display</b></em>'.
 * <!-- end-user-doc -->
 * <p>
 * The following features are implemented:
 * <ul>
 *   <li>{@link robotG.robot.impl.DisplayImpl#getMsg <em>Msg</em>}</li>
 *   <li>{@link robotG.robot.impl.DisplayImpl#getDuration <em>Duration</em>}</li>
 *   <li>{@link robotG.robot.impl.DisplayImpl#getLine <em>Line</em>}</li>
 *   <li>{@link robotG.robot.impl.DisplayImpl#getCol <em>Col</em>}</li>
 * </ul>
 * </p>
 *
 * @generated
 */
public class DisplayImpl extends CommandeRobotImpl implements Display {
	/**
   * The default value of the '{@link #getMsg() <em>Msg</em>}' attribute.
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @see #getMsg()
   * @generated
   * @ordered
   */
	protected static final String MSG_EDEFAULT = null;

	/**
   * The cached value of the '{@link #getMsg() <em>Msg</em>}' attribute.
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @see #getMsg()
   * @generated
   * @ordered
   */
	protected String msg = MSG_EDEFAULT;

	/**
   * The default value of the '{@link #getDuration() <em>Duration</em>}' attribute.
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @see #getDuration()
   * @generated
   * @ordered
   */
	protected static final int DURATION_EDEFAULT = 0;

	/**
   * The cached value of the '{@link #getDuration() <em>Duration</em>}' attribute.
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @see #getDuration()
   * @generated
   * @ordered
   */
	protected int duration = DURATION_EDEFAULT;

	/**
   * The default value of the '{@link #getLine() <em>Line</em>}' attribute.
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @see #getLine()
   * @generated
   * @ordered
   */
	protected static final int LINE_EDEFAULT = 0;

	/**
   * The cached value of the '{@link #getLine() <em>Line</em>}' attribute.
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @see #getLine()
   * @generated
   * @ordered
   */
	protected int line = LINE_EDEFAULT;

	/**
   * The default value of the '{@link #getCol() <em>Col</em>}' attribute.
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @see #getCol()
   * @generated
   * @ordered
   */
	protected static final int COL_EDEFAULT = 0;

	/**
   * The cached value of the '{@link #getCol() <em>Col</em>}' attribute.
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @see #getCol()
   * @generated
   * @ordered
   */
	protected int col = COL_EDEFAULT;

	/**
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @generated
   */
	protected DisplayImpl() {
    super();
  }

	/**
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @generated
   */
	@Override
	protected EClass eStaticClass() {
    return RobotPackage.Literals.DISPLAY;
  }

	/**
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @generated
   */
	public String getMsg() {
    return msg;
  }

	/**
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @generated
   */
	public void setMsg(String newMsg) {
    String oldMsg = msg;
    msg = newMsg;
    if (eNotificationRequired())
      eNotify(new ENotificationImpl(this, Notification.SET, RobotPackage.DISPLAY__MSG, oldMsg, msg));
  }

	/**
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @generated
   */
	public int getDuration() {
    return duration;
  }

	/**
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @generated
   */
	public void setDuration(int newDuration) {
    int oldDuration = duration;
    duration = newDuration;
    if (eNotificationRequired())
      eNotify(new ENotificationImpl(this, Notification.SET, RobotPackage.DISPLAY__DURATION, oldDuration, duration));
  }

	/**
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @generated
   */
	public int getLine() {
    return line;
  }

	/**
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @generated
   */
	public void setLine(int newLine) {
    int oldLine = line;
    line = newLine;
    if (eNotificationRequired())
      eNotify(new ENotificationImpl(this, Notification.SET, RobotPackage.DISPLAY__LINE, oldLine, line));
  }

	/**
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @generated
   */
	public int getCol() {
    return col;
  }

	/**
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @generated
   */
	public void setCol(int newCol) {
    int oldCol = col;
    col = newCol;
    if (eNotificationRequired())
      eNotify(new ENotificationImpl(this, Notification.SET, RobotPackage.DISPLAY__COL, oldCol, col));
  }

	/**
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @generated
   */
	@Override
	public Object eGet(int featureID, boolean resolve, boolean coreType) {
    switch (featureID)
    {
      case RobotPackage.DISPLAY__MSG:
        return getMsg();
      case RobotPackage.DISPLAY__DURATION:
        return getDuration();
      case RobotPackage.DISPLAY__LINE:
        return getLine();
      case RobotPackage.DISPLAY__COL:
        return getCol();
    }
    return super.eGet(featureID, resolve, coreType);
  }

	/**
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @generated
   */
	@Override
	public void eSet(int featureID, Object newValue) {
    switch (featureID)
    {
      case RobotPackage.DISPLAY__MSG:
        setMsg((String)newValue);
        return;
      case RobotPackage.DISPLAY__DURATION:
        setDuration((Integer)newValue);
        return;
      case RobotPackage.DISPLAY__LINE:
        setLine((Integer)newValue);
        return;
      case RobotPackage.DISPLAY__COL:
        setCol((Integer)newValue);
        return;
    }
    super.eSet(featureID, newValue);
  }

	/**
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @generated
   */
	@Override
	public void eUnset(int featureID) {
    switch (featureID)
    {
      case RobotPackage.DISPLAY__MSG:
        setMsg(MSG_EDEFAULT);
        return;
      case RobotPackage.DISPLAY__DURATION:
        setDuration(DURATION_EDEFAULT);
        return;
      case RobotPackage.DISPLAY__LINE:
        setLine(LINE_EDEFAULT);
        return;
      case RobotPackage.DISPLAY__COL:
        setCol(COL_EDEFAULT);
        return;
    }
    super.eUnset(featureID);
  }

	/**
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @generated
   */
	@Override
	public boolean eIsSet(int featureID) {
    switch (featureID)
    {
      case RobotPackage.DISPLAY__MSG:
        return MSG_EDEFAULT == null ? msg != null : !MSG_EDEFAULT.equals(msg);
      case RobotPackage.DISPLAY__DURATION:
        return duration != DURATION_EDEFAULT;
      case RobotPackage.DISPLAY__LINE:
        return line != LINE_EDEFAULT;
      case RobotPackage.DISPLAY__COL:
        return col != COL_EDEFAULT;
    }
    return super.eIsSet(featureID);
  }

	/**
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @generated
   */
	@Override
	public String toString() {
    if (eIsProxy()) return super.toString();

    StringBuffer result = new StringBuffer(super.toString());
    result.append(" (msg: ");
    result.append(msg);
    result.append(", duration: ");
    result.append(duration);
    result.append(", line: ");
    result.append(line);
    result.append(", col: ");
    result.append(col);
    result.append(')');
    return result.toString();
  }

} //DisplayImpl
