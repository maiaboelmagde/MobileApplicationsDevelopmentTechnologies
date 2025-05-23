import React from 'react';
import { View, Text, Image } from 'react-native';

export default function InfoScreen({ route }) {
  const { user } = route.params;

  return (
    <View style={{ padding: 20 }}>
      <Image source={{ uri: user.picture.large }} style={{ width: 100, height: 100, borderRadius: 50 }} />
      <Text style={{ fontSize: 18, marginTop: 10 }}>
        {user.name.first} {user.name.last}
      </Text>
      <Text>Email: {user.email}</Text>
      <Text>Phone: {user.phone}</Text>
      <Text>City: {user.location.city}</Text>
    </View>
  );
}
