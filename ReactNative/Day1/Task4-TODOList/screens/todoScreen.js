import React, { useState, useEffect} from 'react';
import { View, Text, TextInput, Button, FlatList, StyleSheet, Pressable, Image } from 'react-native';
import { Checkbox } from 'react-native-paper';
import { IconButton } from 'react-native-paper';
import AsyncStorage from '@react-native-async-storage/async-storage';



export default function TodoListComponent() {
    const iconImage = require('../assets/todo_app_icon.webp')
    const [todos, setTodos] = useState([]);
    const [text, setText] = useState('');
    const [ErrorText, setErrorText] = useState('');
    const [editingId, setEditingId] = useState(null);
    const [editingText, setEditingText] = useState('');

    //Load Todos
    useEffect(() => {
        const loadTodos = async () => {
            try {
                const storedTodos = await AsyncStorage.getItem('todos');
                if (storedTodos) {
                    setTodos(JSON.parse(storedTodos));
                }
            } catch (error) {
                console.log('Failed to load todos', error);
            }
        };

        loadTodos();
    }, []);


    //Save Todos on Change
    useEffect(() => {
        const saveTodos = async () => {
            try {
                await AsyncStorage.setItem('todos', JSON.stringify(todos));
            } catch (error) {
                console.log('Failed to save todos', error);
            }
        };

        saveTodos();
    }, [todos]);


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


    const startEditing = (item) => {
        setEditingId(item.id);
        setEditingText(item.title);
    };

    const saveEdit = (itemId) => {
        if (editingText.trim().length < 3) {
            alert("Task title should be at least 3 characters");
            return;
        }

        const updatedTodos = todos.map(todo =>
            todo.id === itemId ? { ...todo, title: editingText } : todo
        );
        setTodos(updatedTodos);
        setEditingId(null);
        setEditingText('');
    };

    return (

        <View style={styles.container}>
            <Image
                source={iconImage}
                style={{
                    width: 100,
                    height: 100,
                    borderRadius: 50,
                    alignSelf: 'center',
                    marginBottom: 20,
                    marginTop: 10,
                    resizeMode: 'cover'
                }}
            />
            <Text style={styles.heading}>My Todo List</Text>

            <View style={styles.inputContainer}>
                <TextInput
                    style={styles.input}
                    placeholder="Enter a new task"
                    value={text}
                    onChangeText={setText}
                />
                <Text style={{ color: 'red' }}>{ErrorText}</Text>
                <Pressable onPress={addTodo} style={{ borderRadius: 20, backgroundColor: 'purple', paddingHorizontal: 16, paddingVertical: 8, width:'100%'}}>
                    <Text style={{ color: 'white', fontSize: 16, textAlign: 'center' }}>Add</Text>
                </Pressable>

            </View>
            
            {todos.length ?
            <Text style={[styles.taskSummary,{marginTop:20, alignSelf:'center'}]}>
                {todos.filter(todo => todo.completed).length} of {todos.length} tasks completed
            </Text>
            :
            <Text></Text>}

            <FlatList
                data={todos}
                keyExtractor={(item) => item.id}
                ListEmptyComponent={
                    <View style={{ justifyContent: 'center', alignItems: 'center' }}>
                        <Text style={{margin:50}}>No Tasks yet</Text>
                    </View>
                }

                
                renderItem={({ item }) => <View style={[styles.TaskContainer]}>
                    <Checkbox
                        onPress={() => handleCompleted(item.id)}
                        status={item.completed ? 'checked' : 'unchecked'}
                    ></Checkbox>
                    {editingId === item.id ? (
                        <TextInput
                            style={[styles.input, { flex: 1 }]}
                            value={editingText}
                            onChangeText={setEditingText}
                            onSubmitEditing={() => saveEdit(item.id)}
                            autoFocus
                        />
                        ) : (
                        <Text
                            style={[
                            styles.todoItem,
                            { textDecorationLine: item.completed ? 'line-through' : 'none', flex: 1 },
                            ]}
                        >
                            {item.title}
                        </Text>
                    )}


                    <View>

                        <IconButton
                        icon="delete"
                        iconColor='red'
                        size={18}
                        onPress={() => handleDelete(item.id)}
                        />

                        {editingId === item.id ? (
                        <IconButton icon="content-save" onPress={() => saveEdit(item.id)} />
                        ) : (
                        <IconButton icon="pencil" onPress={() => startEditing(item)} />
                        )}

                    </View>


                </View>}
                ItemSeparatorComponent={<View style={styles.sepLine} />}
            />
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex:1,
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
        flexDirection: 'col',
        gap: 8,
        alignItems: 'center',
        marginBottom: 12,
    },
    input: {
        flex: 1,
        width: '100%',
        minHeight: 50,
        borderWidth: 1.5,
        borderColor: '#aaa',
        borderRadius: 10,
        backgroundColor: '#fff',
        color: '#333',
        fontSize: 18,
        paddingHorizontal: 12,
        paddingVertical: 10,
        marginRight: 8,
        shadowColor: '#000',
        shadowOffset: { width: 0, height: 1 },
        shadowOpacity: 0.1,
        shadowRadius: 2,
        elevation: 2,
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
