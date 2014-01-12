/**
 */
package robotG.robot;


/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Set Turn Angle</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link robotG.robot.SetTurnAngle#getAngle <em>Angle</em>}</li>
 * </ul>
 * </p>
 *
 * @see robotG.robot.RobotPackage#getSetTurnAngle()
 * @model
 * @generated
 */
public interface SetTurnAngle extends CommandeRobot {
	/**
   * Returns the value of the '<em><b>Angle</b></em>' attribute.
   * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Angle</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
   * @return the value of the '<em>Angle</em>' attribute.
   * @see #setAngle(int)
   * @see robotG.robot.RobotPackage#getSetTurnAngle_Angle()
   * @model required="true"
   * @generated
   */
	int getAngle();

	/**
   * Sets the value of the '{@link robotG.robot.SetTurnAngle#getAngle <em>Angle</em>}' attribute.
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @param value the new value of the '<em>Angle</em>' attribute.
   * @see #getAngle()
   * @generated
   */
	void setAngle(int value);

} // SetTurnAngle
