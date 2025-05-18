// components/TodoListComponent.js
import React, { useState } from 'react';
import { View, Text, TextInput, Button, FlatList, StyleSheet } from 'react-native';
import { Checkbox } from 'react-native-paper';
import { IconButton } from 'react-native-paper';


export default function TodoListComponent() {
    const [todos, setTodos] = useState([]);
    const [text, setText] = useState('');
    const [ErrorText, setErrorText] = useState('');

    const addTodo = () => {
        if (text.trim().length < 3) {
            setErrorText('Task title should contain more than 3 letters');
            return;
        };

        const newTodo = {
            id: Date.now().toString(),
            title: text,
            completed: false
        };

        setTodos([...todos, newTodo]);
        setErrorText('');
        setText('');
    };

    const handleCompleted = (itemId) => {
        const updatedTodos = todos.map((curTodo) => {
            return curTodo.id == itemId ? { ...curTodo, completed: !curTodo.completed } : curTodo
        });

        setTodos(updatedTodos);
    }



    const handleDelete = (itemId) => {
        const updatedTodos = todos.filter((todo) => todo.id !== itemId);
        setTodos(updatedTodos);
    };


    return (
        <View style={styles.container}>
            <Text style={styles.heading}>My Todo List</Text>

            <View style={styles.inputContainer}>
                <TextInput
                    style={styles.input}
                    placeholder="Enter a new task"
                    value={text}
                    onChangeText={setText}
                />
                <Button title="Add" onPress={addTodo} />
            </View>
            <Text style={{ color: 'red' }}>{ErrorText}</Text>

            <FlatList
                data={todos}
                keyExtractor={(item) => item.id}
                ListEmptyComponent={
                    <View style={{ justifyContent: 'center', alignItems: 'center' }}>
                        <Text>No Tasks yet</Text>
                    </View>
                }

                ListHeaderComponent={
                    todos.length ?
                        <Text style={[styles.taskSummary]}>
                            {todos.filter(todo => todo.completed).length} of {todos.length} tasks completed
                        </Text>
                        :
                        <Text></Text>
                }
                renderItem={({ item }) => <View style={styles.TaskContainer}>
                    <Checkbox
                        onPress={() => handleCompleted(item.id)}
                        status={item.completed ? 'checked' : 'unchecked'}
                    ></Checkbox>
                    <Text style={[styles.todoItem, { textDecorationLine: item.completed ? 'line-through' : 'none' }]}>{item.title}</Text>
                    <IconButton
                        icon="delete"
                        iconColor='red'
                        size={18}
                        onPress={() => handleDelete(item.id)}
                    />

                </View>}
                ItemSeparatorComponent={<View style={styles.sepLine} />}
            />
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        width: '100%',
        paddingHorizontal: 10,
        marginTop: 20,
    },
    heading: {
        fontSize: 24,
        fontWeight: 'bold',
        marginBottom: 12,
        textAlign: 'center',
    },
    inputContainer: {
        flexDirection: 'row',
        gap: 8,
        alignItems: 'center',
        marginBottom: 12,
    },
    input: {
        flex: 1,
        borderBottomWidth: 1,
        fontSize: 20,
        padding: 8,
        borderColor: '#ccc',
        marginRight: 8,
    },
    todoItem: {
        fontSize: 18,
        paddingVertical: 6,
    },
    sepLine: {
        width: '80%',
        marginHorizontal: '10%',
        height: 1,
        backgroundColor: '#ccc'
    },
    TaskContainer: {
        backgroundColor: '#fff', // required for shadow to be visible
        padding: 16,
        borderRadius: 8,
        margin: 10,
        flexDirection: 'row',
        justifyContent:'space-between',

        // iOS shadow
        shadowColor: '#000',
        shadowOffset: { width: 2, height: 4 },
        shadowOpacity: 1,
        shadowRadius: 4,

        // Android shadow
        elevation: 6,

    },

    taskSummary: {
        fontSize: 18,
        fontWeight: '500',
        marginBottom: 8,
        marginLeft: 10,
    },

});
