import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View, FlatList } from 'react-native';
import 'react-native-get-random-values';
import { v4 as uuid } from 'uuid';
import ColorBox from './components/colorBox';

export default function App() {
  return (
    <View style={styles.container}>
          <Text style={styles.title}>Welcome to my 1st ReactNative project !</Text>
          <FlatList
            data={colorsWithId}
            keyExtractor={(item) => item.id}
            renderItem={({ item }) => (
              <ColorBox colorName={item.colorName} hexNum={item.hexNum} />
            )}
          />
        </View>
  );
}



const colors = [
  { colorName: "Red", hexNum: "#FF0000" },
  { colorName: "Green", hexNum: "#008000" },
  { colorName: "Blue", hexNum: "#0000FF" },
  { colorName: "Yellow", hexNum: "#FFFF00" },
  { colorName: "Orange", hexNum: "#FFA500" },
  { colorName: "Purple", hexNum: "#800080" },
  { colorName: "Pink", hexNum: "#FFC0CB" },
  { colorName: "Brown", hexNum: "#A52A2A" },
  { colorName: "Black", hexNum: "#000000" },
  { colorName: "White", hexNum: "#FFFFFF" },
  { colorName: "Cyan", hexNum: "#00FFFF" },
  { colorName: "Magenta", hexNum: "#FF00FF" },
  { colorName: "Lime", hexNum: "#00FF00" },
  { colorName: "Navy", hexNum: "#000080" },
  { colorName: "Teal", hexNum: "#008080" },
  { colorName: "Olive", hexNum: "#808000" },
  { colorName: "Maroon", hexNum: "#800000" },
  { colorName: "Silver", hexNum: "#C0C0C0" },
  { colorName: "Gold", hexNum: "#FFD700" },
  { colorName: "Coral", hexNum: "#FF7F50" }
];

const colorsWithId = colors.map(color => ({ ...color, id: uuid() }));

const styles = StyleSheet.create({
  title: {
    textAlign: 'center',
    
    marginBottom: 5,
    fontWeight: 'bold',
  },
  container: {
    flex: 1,
    backgroundColor: '#F0F0D0',
    paddingTop: 25,
  },
});

