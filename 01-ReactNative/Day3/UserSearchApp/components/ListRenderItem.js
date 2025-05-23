import React from 'react';
import { View, Text, TouchableOpacity, Image } from 'react-native';
import { useNavigation } from '@react-navigation/native';
import routes from '../navigators/routes';

export default function ListRenderItem({ user }) {
  const navigation = useNavigation();

  return (
    <TouchableOpacity onPress={() => navigation.navigate(routes.Info, { user })}>
      <View style={{ flexDirection: 'row', alignItems: 'center', padding: 10 }}>
        <Image
          source={{ uri: user.picture.thumbnail }}
          style={{ width: 50, height: 50, borderRadius: 25, marginRight: 10 }}
        />
        <Text>{user.name.first} {user.name.last}</Text>
      </View>
    </TouchableOpacity>
  );
}
