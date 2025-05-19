import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import routes from './routes';
import HomeScreen from '../screens/HomeScreen';
import InfoScreen from '../screens/InfoScreen';

const Stack = createNativeStackNavigator();

export default function InfoNavigator() {
  return (
    <NavigationContainer>
      <Stack.Navigator>
        <Stack.Screen name={routes.Home} options={{
            headerTitleAlign:'center'
        }} component={HomeScreen} />
        <Stack.Screen name={routes.Info} component={InfoScreen} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}
