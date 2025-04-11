import React from "react";
import { useParams, useNavigate } from "react-router-dom";

const EmployeeDetails = () => {
  const { id } = useParams();
  const navigate = useNavigate();
  const employees = JSON.parse(localStorage.getItem("employees")) || [];
  const employee = employees.find(emp => emp.id.toString() === id);

  if (!employee) return <div className="p-8">Employee not found</div>;

  return (
    <div className="p-8">
      <button onClick={() => navigate(-1)} className="mb-4 px-4 py-2 bg-gray-300 rounded">Back</button>
      <h2 className="text-2xl font-bold mb-4">{employee.name}'s Details</h2>
      <p><strong>Email:</strong> {employee.email}</p>
      <p><strong>Contact No:</strong> {employee.contact}</p>
      <p><strong>Age:</strong> {employee.age}</p>
      <p><strong>Position:</strong> {employee.position}</p>
      <p><strong>City:</strong> {employee.city}</p>
      <p><strong>Salary:</strong> ${employee.salary}</p>
    </div>
  );
};

export default EmployeeDetails;