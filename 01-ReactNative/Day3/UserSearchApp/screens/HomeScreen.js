import React, { useEffect, useState } from 'react';
import { View, FlatList, TextInput } from 'react-native';
import ListRenderItem from '../components/ListRenderItem';

export default function HomeScreen() {
  const [users, setUsers] = useState([]);
  const [filteredUsers, setFilteredUsers] = useState([]);
  const [searchText, setSearchText] = useState('');

  useEffect(() => {
    fetch('https://randomuser.me/api/?results=20')
      .then((res) => res.json())
      .then((data) => {
        setUsers(data.results);
        setFilteredUsers(data.results);
      });
  }, []);

  const handleSearch = (text) => {
    setSearchText(text);
    const filtered = users.filter((user) =>
      `${user.name.first} ${user.name.last}`.toLowerCase().includes(text.toLowerCase())
    );
    setFilteredUsers(filtered);
  };

  return (
    <View style={{ flex: 1, padding: 10 }}>
      <TextInput
        style={{
          borderColor: 'blue',
          borderWidth: 1,
          padding: 10,
          borderRadius: 8,
          marginBottom: 10,
        }}
        placeholder="Search users..."
        value={searchText}
        onChangeText={handleSearch}
      />
      <FlatList
        data={filteredUsers}
        keyExtractor={(item) => item.login.uuid}
        renderItem={({ item }) => <ListRenderItem user={item} />}
      />
    </View>
  );
}
