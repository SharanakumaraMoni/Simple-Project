// pages/EditEmployee.jsx
import React, { useState, useEffect } from "react";
import { useNavigate, useParams } from "react-router-dom";

const EditEmployee = () => {
  const { id } = useParams();
  const navigate = useNavigate();
  const [form, setForm] = useState({});

  useEffect(() => {
    const employees = JSON.parse(localStorage.getItem("employees")) || [];
    const emp = employees.find(e => e.id.toString() === id);
    if (emp) setForm(emp);
  }, [id]);

  const handleChange = (e) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const handleUpdate = (e) => {
    e.preventDefault();
    let employees = JSON.parse(localStorage.getItem("employees")) || [];
    employees = employees.map(e => e.id.toString() === id ? form : e);
    localStorage.setItem("employees", JSON.stringify(employees));
    navigate("/");
  };

  const handleDelete = () => {
    let employees = JSON.parse(localStorage.getItem("employees")) || [];
    employees = employees.filter(e => e.id.toString() !== id);
    localStorage.setItem("employees", JSON.stringify(employees));
    navigate("/");
  };

  return (
    <div className="p-8">
      <h2 className="text-2xl font-bold mb-4">Edit Employee</h2>
      <form onSubmit={handleUpdate} className="space-y-4 max-w-md">
        {["name", "email", "contact", "age", "position", "city", "salary"].map((field) => (
          <input
            key={field}
            name={field}
            value={form[field] || ""}
            onChange={handleChange}
            placeholder={field}
            className="w-full border p-2 rounded"
            required
          />
        ))}
        <div className="space-x-4">
          <button type="submit" className="bg-green-500 text-white px-4 py-2 rounded">Update</button>
          <button type="button" onClick={handleDelete} className="bg-red-500 text-white px-4 py-2 rounded">Delete</button>
        </div>
      </form>
    </div>
  );
};

export default EditEmployee;
