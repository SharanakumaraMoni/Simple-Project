import React from "react";
import { BrowserRouter as Router, Routes, Route, Navigate } from "react-router-dom";
import Login from "./pages/Login";
import Dashboard from "./pages/Dashboard";
import EmployeeDetails from "./pages/EmployeeDetails";
import { AuthProvider, useAuth } from "./context/AuthContext";
import AddEmployee from "./pages/AddEmployee";
import EditEmployee from "./pages/EditEmployee";


const PrivateRoute = ({ children }) => {
  const { isAuthenticated } = useAuth();
  return isAuthenticated ? children : <Navigate to="/login" />;
};

export default function App() {
  return (
    <AuthProvider>
      <Router>
        <Routes>
          <Route path="/login" element={<Login />} />
          <Route path="/" element={<PrivateRoute><Dashboard /></PrivateRoute>} />
          <Route path="/employee/:id" element={<PrivateRoute><EmployeeDetails /></PrivateRoute>} />
          <Route path="/add" element={<PrivateRoute><AddEmployee /></PrivateRoute>} />
          <Route path="/edit/:id" element={<PrivateRoute><EditEmployee /></PrivateRoute>} />
        </Routes>
      </Router>
    </AuthProvider>
  );
}

