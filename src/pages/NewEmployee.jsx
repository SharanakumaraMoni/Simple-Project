import React, { useState } from "react";
import { useNavigate } from "react-router-dom";

const NewEmployee = () => {
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    contact: "",
    age: "",
    position: "",
    city: "",
    salary: "",
  });

  const navigate = useNavigate();

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value,
    });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    const employees = JSON.parse(localStorage.getItem("employees")) || [];
    const newEmployee = {
      ...formData,
      id: Date.now(),
    };
    localStorage.setItem("employees", JSON.stringify([...employees, newEmployee]));
    navigate("/");
  };

  return (
    <div className="p-8 max-w-xl mx-auto">
      <h2 className="text-2xl font-bold mb-4">Add New Employee</h2>
      <form onSubmit={handleSubmit} className="bg-white p-6 rounded shadow-md space-y-4">
        {Object.keys(formData).map((field) => (
          <input
            key={field}
            type="text"
            name={field}
            placeholder={field.charAt(0).toUpperCase() + field.slice(1)}
            value={formData[field]}
            onChange={handleChange}
            className="w-full p-2 border rounded"
            required
          />
        ))}
        <button type="submit" className="w-full bg-blue-500 text-white p-2 rounded">
          Save Employee
        </button>
      </form>
    </div>
  );
};

export default NewEmployee;
