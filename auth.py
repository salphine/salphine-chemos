import streamlit as st
import hashlib
import time
from database import Database

class Authentication:
    def __init__(self):
        self.db = Database()
        
    def hash_password(self, password):
        """Simple password hashing"""
        return hashlib.sha256(password.encode()).hexdigest()
    
    def login(self, username, password):
        """Authenticate user"""
        # Use ? as placeholder for SQLite
        query = "SELECT * FROM users WHERE username = ? AND password = ? AND is_active = TRUE"
        hashed_password = self.hash_password(password)
        
        result = self.db.execute_query(query, (username, hashed_password))
        
        if result and len(result) > 0:
            user = result[0]
            return {
                'authenticated': True,
                'username': user['username'],
                'role': user['role'],
                'user_id': user['id']
            }
        
        # For demo purposes, check default credentials
        if username == 'admin' and password == 'admin123':
            return {
                'authenticated': True,
                'username': 'admin',
                'role': 'admin',
                'user_id': 1
            }
        
        return {'authenticated': False, 'error': 'Invalid credentials'}
    
    def logout(self):
        """Clear session state"""
        for key in list(st.session_state.keys()):
            del st.session_state[key]
    
    def check_auth(self):
        """Check if user is authenticated"""
        if 'authenticated' not in st.session_state:
            return False
        return st.session_state.authenticated
    
    # Optional: Add more authentication methods
    def register_user(self, username, password, role='user'):
        """Register a new user"""
        # Check if user already exists
        check_query = "SELECT * FROM users WHERE username = ?"
        existing_user = self.db.execute_query(check_query, (username,))
        
        if existing_user:
            return {'success': False, 'error': 'Username already exists'}
        
        # Insert new user
        hashed_password = self.hash_password(password)
        insert_query = """
            INSERT INTO users (username, password, role, is_active, created_at) 
            VALUES (?, ?, ?, TRUE, datetime('now'))
        """
        
        try:
            self.db.execute_query(insert_query, (username, hashed_password, role))
            return {'success': True, 'message': 'User registered successfully'}
        except Exception as e:
            return {'success': False, 'error': str(e)}