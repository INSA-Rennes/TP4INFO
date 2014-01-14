/**
 */
package robotG.robot;


/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Bip</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * <ul>
 *   <li>{@link robotG.robot.Bip#getDuration <em>Duration</em>}</li>
 *   <li>{@link robotG.robot.Bip#getPower <em>Power</em>}</li>
 *   <li>{@link robotG.robot.Bip#isRepeat <em>Repeat</em>}</li>
 * </ul>
 * </p>
 *
 * @see robotG.robot.RobotPackage#getBip()
 * @model
 * @generated
 */
public interface Bip extends CommandeRobot {
	/**
   * Returns the value of the '<em><b>Duration</b></em>' attribute.
   * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Duration</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
   * @return the value of the '<em>Duration</em>' attribute.
   * @see #setDuration(int)
   * @see robotG.robot.RobotPackage#getBip_Duration()
   * @model required="true"
   * @generated
   */
	int getDuration();

	/**
   * Sets the value of the '{@link robotG.robot.Bip#getDuration <em>Duration</em>}' attribute.
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @param value the new value of the '<em>Duration</em>' attribute.
   * @see #getDuration()
   * @generated
   */
	void setDuration(int value);

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
   * @see robotG.robot.RobotPackage#getBip_Power()
   * @model required="true"
   * @generated
   */
	int getPower();

	/**
   * Sets the value of the '{@link robotG.robot.Bip#getPower <em>Power</em>}' attribute.
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @param value the new value of the '<em>Power</em>' attribute.
   * @see #getPower()
   * @generated
   */
	void setPower(int value);

	/**
   * Returns the value of the '<em><b>Repeat</b></em>' attribute.
   * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Repeat</em>' attribute isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
   * @return the value of the '<em>Repeat</em>' attribute.
   * @see #setRepeat(boolean)
   * @see robotG.robot.RobotPackage#getBip_Repeat()
   * @model required="true"
   * @generated
   */
	boolean isRepeat();

	/**
   * Sets the value of the '{@link robotG.robot.Bip#isRepeat <em>Repeat</em>}' attribute.
   * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
   * @param value the new value of the '<em>Repeat</em>' attribute.
   * @see #isRepeat()
   * @generated
   */
	void setRepeat(boolean value);

} // Bip
