/*Complete School Management System*/

CREATE DATABASE university_management;
USE university_management;


CREATE TABLE university_management.tbl_school(sch_id INTEGER PRIMARY KEY,
						sch_name VARCHAR(40) NOT NULL,
                        sch_address varchar(50) NOT NULL,
                        sch_phone_no INTEGER unique);
CREATE TABLE university_management.tbl_student(st_id INTEGER PRIMARY KEY,
						roll_no INTEGER UNIQUE,
                        st_name VARCHAR(40) NOT NULL,
                        pa_id INTEGER NOT NULL,
						reg_id INTEGER NOT NULL,
                        st_phone_no INTEGER UNIQUE,
                        st_DOB DATE NOT NULL,
                        st_gender VARCHAR(10) NOT NULL,
                        st_email VARCHAR(40) UNIQUE,
							CONSTRAINT parent_id FOREIGN KEY (pa_id) REFERENCES university_management.tbl_parent(pa_id),
							CONSTRAINT registration_id FOREIGN KEY (reg_id) REFERENCES university_management.tbl_registration(reg_id));                       
CREATE TABLE university_management.tbl_parent(pa_id INTEGER PRIMARY KEY,
						pa_name VARCHAR(40) NOT NULL,
                        pa_phone_no INTEGER UNIQUE,
                        pa_occupation VARCHAR(30) NOT NULL,
                        pa_address VARCHAR(50) NOT NULL);
CREATE TABLE university_management.tbl_registration(reg_id INTEGER PRIMARY KEY,
						reg_no INTEGER NOT NULL,
                        reg_date DATE NOT NULL);
CREATE TABLE university_management.tbl_course_reg(co_id INTEGER PRIMARY KEY,
						co_name VARCHAR(30) NOT NULL,
                        co_date DATE NOT NULL,
                        st_id INTEGER NOT NULL,
                        st_date INTEGER NOT NULL,
                        CONSTRAINT st_id FOREIGN KEY(st_id) REFERENCES university_management.tbl_student(st_id));
CREATE TABLE university_management.tbl_class(cl_id INTEGER PRIMARY KEY,
						cl_name VARCHAR(30) NOT NULL,
                        st_id INTEGER NOT NULL,
                        co_id INTEGER NOT NULL,
                        room_id INTEGER NOT NULL,
                        teacher_id INTEGER NOT NULL,
                        cls_date DATE NOT NULL,
                        cls_start_time  TIME NOT NULL,
                        cls_end_time TIME,
                        CONSTRAINT student_id FOREIGN KEY(st_id) REFERENCES university_management.tbl_student(st_id),
                        CONSTRAINT course_id FOREIGN KEY(co_id) REFERENCES university_management.tbl_course_reg(co_id),
                        CONSTRAINT room_id FOREIGN KEY(room_id) REFERENCES university_management.tbl_rooms(room_id),
                        CONSTRAINT teacher_id FOREIGN KEY(teacher_id) REFERENCES university_management.tbl_teacher(teacher_id));
                        
CREATE TABLE university_management.tbl_teacher(teacher_id INTEGER PRIMARY KEY,
						te_name VARCHAR(40) NOT NULL,
                        te_phone_no INTEGER NOT NULL,
                        te_email VARCHAR(30) UNIQUE,
                        te_gender VARCHAR(10) NOT NULL,
                        te_join_date DATE NOT NULL
                        );
CREATE TABLE university_management.tbl_rooms(room_id INTEGER PRIMARY KEY,
						matric_no INTEGER UNIQUE);
CREATE TABLE university_management.tbl_quizies(quiz_id INTEGER PRIMARY KEY,
						quiz_date DATE NOT NULL,
                        quiz_type_id INTEGER NOT NULL,
                        st_id INTEGER NOT NULL,
                        co_id INTEGER NOT NULL,
                        teacher_id INTEGER NOT NULL,
                        marks INTEGER NOT NULL,
                        
						CONSTRAINT student_id1 FOREIGN KEY(st_id) REFERENCES university_management.tbl_student(st_id),
                        CONSTRAINT quiz_type_id FOREIGN KEY(quiz_type_id) REFERENCES university_management.tbl_quiz_type(quiz_type_id),
                        CONSTRAINT course_id1 FOREIGN KEY(co_id) REFERENCES university_management.tbl_course_reg(co_id),
                        CONSTRAINT teacher_id1 FOREIGN KEY(teacher_id) REFERENCES university_management.tbl_teacher(teacher_id));
CREATE TABLE university_management.tbl_quiz_type(quiz_type_id INTEGER PRIMARY KEY,
						quiz_type_name VARCHAR(15) NOT NULL);
CREATE TABLE university_management.tbl_paper(p_id INTEGER PRIMARY KEY,
						st_id INTEGER NOT NULL,
                        teacher_id INTEGER NOT NULL,
                        quiz_id INTEGER NOT NULL,
                        co_id INTEGER NOT NULL,
                        p_date DATE NOT NULL,
                        total_marks INTEGER NOT NULL,
                        obtain_marks INTEGER NOT NULL,
                        
                        CONSTRAINT student_id2 FOREIGN KEY (st_id) REFERENCES university_management.tbl_student(st_id),
                        CONSTRAINT teacher_id2 FOREIGN KEY (teacher_id) REFERENCES university_management.tbl_teacher(teacher_id),
                        CONSTRAINT quiz_id FOREIGN KEY(quiz_id) REFERENCES university_management.tbl_quizies(quiz_id),
                        CONSTRAINT course_id2 FOREIGN KEY (co_id) REFERENCES university_management.tbl_course_reg(co_id)
                        );
                        /*STUDENT FREE DIETS*/
CREATE TABLE university_management.tb_free(f_id INTEGER PRIMARY KEY,
							st_id INTEGER NOT NULL,
                            f_date DATE NOT NULL,
                            bank_id INTEGER NOT NULL,
                            invoice_no INTEGER NOT NULL,
                            last_date DATE NOT NULL,
                            amount DECIMAL(16,3) NOT NULL,
                            free_dues_id INTEGER NOT NULL,
							free_type_id INTEGER NOT NULL,
							CONSTRAINT free_dues_id FOREIGN KEY(free_dues_id) REFERENCES university_management.tbl_free_dues(free_dues_id),
							CONSTRAINT free_type_id FOREIGN KEY(free_type_id) REFERENCES university_management.tbl_free_type(free_type_id),
							CONSTRAINT bank_id FOREIGN KEY (bank_id) REFERENCES university_management.tbl_bank(bank_id));

CREATE TABLE university_management.tbl_free_dues(free_dues_id INTEGER PRIMARY KEY,
								due_date DATE NOT NULL,
                                due_amount DECIMAL(18,3) NOT NULL);
CREATE TABLE university_management.tbl_free_type(free_type_id INTEGER NOT NULL,
								free_type_name VARCHAR(20),
                                status VARCHAR(20) NOT NULL,
								amount DECIMAL(18,3));
CREATE TABLE university_management.tbl_bank(bank_id INTEGER PRIMARY KEY,
								bank_mame VARCHAR(12) NOT NULL,
                                school_account_no INTEGER NOT NULL,
                                deposit_Date DATE NOT NULL,
                                deposit_amount DECIMAL(18,3)
                                );
                                
                                /*MANAGE SCHOOL EMPLOYEE*/
CREATE TABLE university_management.tbl_employee(emp_id INTEGER PRIMARY KEY,
								emp_name VARCHAR(15) NOT NULL,
                                emp_father_name VARCHAR(12) NOT NULL,
                                emp_cnic_no VARCHAR(15) UNIQUE NOT NULL,
                                emp_phone_no VARCHAR(15) UNIQUE NOT NULL,
                                emp_join_date DATE NOT NULL,
                                emp_status VARCHAR(15) NOT NULL,
                                emp_type_id INTEGER NOT NULL,
                                emp_designation_id INTEGER NOT NULL,
                                emp_type INTEGER NOT NULL,
                                emp_category_id INTEGER NOT NULL,
                                CONSTRAINT designation_id FOREIGN KEY (emp_designation_id) REFERENCES university_management.tbl_designation(emp_designation_id),
                                CONSTRAINT emp_type_id FOREIGN KEY (emp_type_id) REFERENCES university_management.tbl_employeee_type(emp_type_id),
                                CONSTRAINT emp_category_id FOREIGN KEY (emp_category_id) REFERENCES university_management.tbl_employee_category(emp_category_id));
CREATE TABLE university_management.designation(emp_designation_id INTEGER PRIMARY KEY,
								des_name VARCHAR(20) NOT NULL);
CREATE TABLE university_management.employee_type(emp_type_id INTEGER PRIMARY KEY,
								emp_type_name VARCHAR(40) NOT NULL);
CREATE TABLE university_management.employee_category(emp_category_id INTEGER PRIMARY KEY,
								emp_category_name VARCHAR(40) NOT NULL);
                                
                                /*EMPLOYEE SALARY MANAGEMENT DATABASE*/
                                
CREATE TABLE university_management.tbl_salary( salary_id INTEGER PRIMARY KEY,
								emp_id INTEGER NOT NULL,
                                emp_designation_id INTEGER NOT NULL,
                                bonus_id INTEGER NOT NULL,
                                advance_salary_id INTEGER NOT NULL,
                                allowance_id INTEGER NOT NULL,
                                total_salary_id INTEGER NOT NULL,
                                total_salary DECIMAL(18,3) NOT NULL,
                                salary_status VARCHAR(13),
                                CONSTRAINT employee_id FOREIGN KEY(emp_id) REFERENCES university_management.tbl_employee(emp_id),
                                CONSTRAINT designation_id FOREIGN KEY(emp_designation_id) REFERENCES university_management.tbl_designation(emp_designation_id),
                                CONSTRAINT allowance_id FOREIGN KEY(allowance_id) REFERENCES university_management.tbl_allowance(allowance_id),
                                CONSTRAINT bonus_id FOREIGN KEY(bonus_id) REFERENCES university_management.tbl_bonus(bonus_id),
                                CONSTRAINT advance_salary_id FOREIGN KEY(advance_salary_id) REFERENCES university_management.advance_salary(advance_salary_id));

CREATE TABLE university_management.allowance(allowance_id INTEGER PRIMARY KEY,
								all_name VARCHAR(12) NOT NULL,
                                all_status VARCHAR(13) NOT NULL,
                                all_amount DECIMAL(18,3) NOT NULL UNIQUE);

CREATE TABLE university_management.tbl_bonus(bonus_id INTEGER PRIMARY KEY,
								bonus_name VARCHAR(25) NOT NULL,
                                bonus_amount DECIMAL(18,3) NOT NULL,
                                bonus_status VARCHAR(23) NOT NULL
                                );
CREATE TABLE university_management.advance_salary(advance_salary_id INTEGER PRIMARY KEY,
								emp_id INTEGER NOT NULL,
                                advances_salary_for_months DECIMAL(18,3) NOT NULL,
                                total_amount DECIMAL(18,3) NOT NULL,
                                recover_duration INTEGER NOT NULL,
                                per_month_recover_amount DECIMAL(18,3) NOT NULL);
                                
                                /*USER AND ROLE*/
CREATE TABLE university_management.tbl_user(user_id INTEGER PRIMARY KEY,
								user_name VARCHAR(30) NOT NULL,
                                password VARCHAR(25) NOT NULL,
                                role_id INTEGER NOT NULL,
                                CONSTRAINT role_id FOREIGN KEY(role_id) REFERENCES university_management.tbl_role(role_id));
CREATE TABLE university_management.tbl_role(role_id INTEGER PRIMARY KEY,
								role_name VARCHAR(34) NOT NULL);
                                
                                
                                
                                
                                

                                
                                
                                
								
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                

								
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            

                        
                        
                        

                        
                        
                        



						
						
                        
                        





                        
