import tkinter as tk
from tkinter import ttk, messagebox
import mysql.connector


def execute_query(query, values=None):
    try:
        mydb = mysql.connector.connect(
            host="localhost",
            user="root",
            password="shreevatsa",
            database="Gym_Management"
        )
        cursor = mydb.cursor()

        if values:
            cursor.execute(query, values)
        else:
            cursor.execute(query)

        if cursor.with_rows:
            result = cursor.fetchall()
            return result
        else:
            print("Query executed successfully!")

        mydb.commit()
        cursor.close()
        mydb.close()
        messagebox.showinfo("Success", "Query executed successfully")
    except mysql.connector.Error as err:
        messagebox.showerror("Error", f"Error: {err}")


def display_results(result):
    result_window = tk.Toplevel()
    result_window.title('Query Results')

    if result:
        num_cols = len(result[0])
        cols = tuple(f"Column {i+1}" for i in range(num_cols))

        tree = ttk.Treeview(result_window, columns=cols, show='headings', height=15)

        for col in cols:
            tree.heading(col, text=col)
            tree.column(col, anchor='w', width=100)

        for row in result:
            tree.insert('', 'end', values=row)

        tree.pack(expand=True, fill='both')
    else:
        messagebox.showinfo("Info", "No results found")



def member_login():
    def display_details():
        query = "SELECT * FROM MEMBER"
        result = execute_query(query)
        display_results(result)

    def create_details():
        def create_member():
            mem_id = entry_mem_id.get()
            name = entry_name.get()
            age = entry_age.get()
            gender = entry_gender.get()

            query = "INSERT INTO MEMBER (mem_id, Fname, age, gender) VALUES (%s, %s, %s, %s)"
            values = (mem_id, name, age, gender)
            execute_query(query, values)
            create_window.destroy()

        create_window = tk.Toplevel(root)
        create_window.title('Create Member')
        create_window.geometry('300x200')

        tk.Label(create_window, text='Member ID:').pack()
        entry_mem_id = tk.Entry(create_window)
        entry_mem_id.pack()

        tk.Label(create_window, text='FName:').pack()
        entry_name = tk.Entry(create_window)
        entry_name.pack()

        tk.Label(create_window, text='Age:').pack()
        entry_age = tk.Entry(create_window)
        entry_age.pack()

        tk.Label(create_window, text='Gender:').pack()
        entry_gender = tk.Entry(create_window)
        entry_gender.pack()

        tk.Button(create_window, text='Create', command=create_member).pack()

    def update_details():
        def update_member():
            mem_id = entry_mem_id.get()
            name = entry_name.get()
            age = entry_age.get()
            gender = entry_gender.get()

            query = "UPDATE MEMBER SET Fname = %s, age = %s, gender = %s WHERE mem_id = %s"
            values = (name, age, gender, mem_id)
            execute_query(query, values)
            update_window.destroy()

        update_window = tk.Toplevel(root)
        update_window.title('Update Member')
        update_window.geometry('300x200')

        tk.Label(update_window, text='Member ID:').pack()
        entry_mem_id = tk.Entry(update_window)
        entry_mem_id.pack()

        tk.Label(update_window, text='Name:').pack()
        entry_name = tk.Entry(update_window)
        entry_name.pack()

        tk.Label(update_window, text='Age:').pack()
        entry_age = tk.Entry(update_window)
        entry_age.pack()

        tk.Label(update_window, text='Gender:').pack()
        entry_gender = tk.Entry(update_window)
        entry_gender.pack()

        tk.Button(update_window, text='Update', command=update_member).pack()

    def execute_custom_query():
        custom_query = entry_custom_query.get()
        result = execute_query(custom_query)
        display_results(result)

    mem_display_window = tk.Toplevel(root)
    mem_display_window.title('Member Display')
    mem_display_window.geometry('400x400')

    tk.Label(mem_display_window, text='Member Details', font=('Arial', 14)).pack()

    tk.Button(mem_display_window, text='Display Details', command=display_details).pack()
    tk.Button(mem_display_window, text='Create Member', command=create_details).pack()
    tk.Button(mem_display_window, text='Update Member', command=update_details).pack()

    tk.Label(mem_display_window, text='Custom Query:', font=('Arial', 10)).pack()
    entry_custom_query = tk.Entry(mem_display_window, width=50)
    entry_custom_query.pack()

    tk.Button(mem_display_window, text='Execute Query', command=execute_custom_query).pack()


def instructor_login():
    def display_details():
        query = "SELECT * FROM INSTRUCTOR"
        result = execute_query(query)
        display_results(result)

    def create_details():
        def create_instructor():
            ins_id = entry_ins_id.get()
            fname = entry_name.get()
            gender = entry_gender.get()

            query = "INSERT INTO INSTRUCTOR (ins_id, fname, gender) VALUES (%s, %s, %s)"
            values = (ins_id, fname, gender)
            execute_query(query, values)
            create_window.destroy()

        create_window = tk.Toplevel(root)
        create_window.title('Create Instructor')
        create_window.geometry('300x200')

        tk.Label(create_window, text='Instructor ID:').pack()
        entry_ins_id = tk.Entry(create_window)
        entry_ins_id.pack()

        tk.Label(create_window, text='FName:').pack()
        entry_name = tk.Entry(create_window)
        entry_name.pack()

        tk.Label(create_window, text='Gender:').pack()
        entry_gender = tk.Entry(create_window)
        entry_gender.pack()

        tk.Button(create_window, text='Create', command=create_instructor).pack()

    def update_details():
        def update_instructor():
            ins_id = entry_ins_id.get()
            name = entry_name.get()
            gender = entry_gender.get()

            query = "UPDATE INSTRUCTOR SET fname = %s, gender = %s WHERE ins_id = %s"
            values = (name, gender, ins_id)
            execute_query(query, values)
            update_window.destroy()

        update_window = tk.Toplevel(root)
        update_window.title('Update Instructor')
        update_window.geometry('300x200')

        tk.Label(update_window, text='Instructor ID:').pack()
        entry_ins_id = tk.Entry(update_window)
        entry_ins_id.pack()

        tk.Label(update_window, text='Name:').pack()
        entry_name = tk.Entry(update_window)
        entry_name.pack()

        tk.Label(update_window, text='Gender:').pack()
        entry_gender = tk.Entry(update_window)
        entry_gender.pack()

        tk.Button(update_window, text='Update', command=update_instructor).pack()

    def execute_custom_query():
        custom_query = entry_custom_query.get()
        result = execute_query(custom_query)
        display_results(result)

    inst_display_window = tk.Toplevel(root)
    inst_display_window.title('Instructor Display')
    inst_display_window.geometry('400x400')

    tk.Label(inst_display_window, text='Instructor Details', font=('Arial', 14)).pack()

    tk.Button(inst_display_window, text='Display Details', command=display_details).pack()
    tk.Button(inst_display_window, text='Create Instructor', command=create_details).pack()
    tk.Button(inst_display_window, text='Update Instructor', command=update_details).pack()

    tk.Label(inst_display_window, text='Custom Query:', font=('Arial', 10)).pack()
    entry_custom_query = tk.Entry(inst_display_window, width=50)
    entry_custom_query.pack()

    tk.Button(inst_display_window, text='Execute Query', command=execute_custom_query).pack()


root = tk.Tk()
root.geometry('400x300')
root.title('Gym Management Software')

main_label = tk.Label(root, text='Gym Management Software', font=('Arial', 20))
main_label.pack(pady=20)

member_button = tk.Button(root, text='Member Login', command=member_login, width=20)
member_button.pack(pady=10)

instructor_button = tk.Button(root, text='Instructor Login', command=instructor_login, width=20)
instructor_button.pack(pady=10)

root.mainloop()
