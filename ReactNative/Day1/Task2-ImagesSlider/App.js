import { StatusBar } from 'expo-status-bar';
import { Image, StyleSheet, View, ScrollView, Dimensions, Text } from 'react-native';

const screenWidth = Dimensions.get('window').width;

export default function App() {
  const images = [
    require('./assets/images/image1.jpeg'),
    require('./assets/images/image2.jpg'),
    require('./assets/images/image3.jpeg'),
    require('./assets/images/image4.jpeg'),
    require('./assets/images/image5.webp'),
  ];

  return (
    <View style={styles.container}>
      <Text style={styles.header}>My Gallary</Text>
      <ScrollView horizontal contentContainerStyle={{alignItems:'center'}}>
        {images.map((img, index) => (
          <Image
            key={index}
            source={img}
            style={styles.image}
            resizeMode="cover"
          />
        ))}
      </ScrollView>
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    height:100
  },
  header:{
    fontSize: 28,
    fontWeight: 'bold',
    color: 'gray',
    textAlign: 'center',
    marginTop:40,
    marginBottom: 10,
  },
  image: {
    width: screenWidth,
    height: 420,
  },
});
