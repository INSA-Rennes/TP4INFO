/**
 */
package robotG.robot;


/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Turn</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link robotG.robot.Turn#getPower <em>Power</em>}</li>
 *   <li>{@link robotG.robot.Turn#getAngle <em>Angle</em>}</li>
 * </ul>
 * </p>
 *
 * @see robotG.robot.RobotPackage#getTurn()
 * @model
 * @generated
 */
public interface Turn extends CommandeRobot {
	/**
   * Returns the value of the '<em><b>Power</b></em>' attribute.
   * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Power</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
   * @return the value of the '<em>Power</em>' attribute.
   * @see #setPower(int)
   * @see robotG.robot.RobotPackage#getTurn_Power()
   * @model required="true"
   * @generated
   */
	int getPower();

	/**
   * Sets the value of the '{@link robotG.robot.Turn#getPower <em>Power</em>}' attribute.
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @param value the new value of the '<em>Power</em>' attribute.
   * @see #getPower()
   * @generated
   */
	void setPower(int value);

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
   * @see robotG.robot.RobotPackage#getTurn_Angle()
   * @model required="true"
   * @generated
   */
	int getAngle();

	/**
   * Sets the value of the '{@link robotG.robot.Turn#getAngle <em>Angle</em>}' attribute.
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @param value the new value of the '<em>Angle</em>' attribute.
   * @see #getAngle()
   * @generated
   */
	void setAngle(int value);

} // Turn
