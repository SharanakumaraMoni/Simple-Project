import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import NewEmployeeButton from "../components/NewEmployeeButton";


const Dashboard = () => {
  const [employees, setEmployees] = useState([]);
  const navigate = useNavigate();

  useEffect(() => {
    const data = JSON.parse(localStorage.getItem("employees")) || [];
    setEmployees(data);
  }, []);

  const handleViewDetails = (id) => {
    navigate(`/employee/${id}`);
  };

  return (
    <div className="p-8">
      <h2 className="text-2xl font-bold mb-4">Employee List</h2>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        {employees.map(emp => (
          <div key={emp.id} onClick={() => handleViewDetails(emp.id)} className="cursor-pointer bg-white p-4 rounded shadow hover:shadow-lg">
            <h3 className="text-xl font-semibold">{emp.name}</h3>
            <p>Email: {emp.email}</p>
            <p>Contact No: {emp.contact}</p>
          </div>
        ))}
      </div>
    </div>
  );
};

export default Dashboard;