import { StatusBar } from 'expo-status-bar';
import { StyleSheet, View } from 'react-native';
import InfoNavigator from './navigators/InfoNavigator';

export default function App() {
  return (
    <View style={styles.container}>
      <InfoNavigator />
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
});
