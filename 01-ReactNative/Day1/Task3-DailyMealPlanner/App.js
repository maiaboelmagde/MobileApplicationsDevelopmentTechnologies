import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View, SectionList, Image } from 'react-native';

export default function App() {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>My Meal Planner</Text>

      <SectionList
        sections={mealsByDay}
        keyExtractor={(item, index) =>index}
        renderItem={({ item }) => (
          <View style={styles.item}>
            <Image source={item.avatar} style={styles.avatar} />
            <Text style={styles.itemText}>{item.name}</Text>
          </View>
        )}
        renderSectionHeader={({ section: { title } }) => (
          <Text style={styles.sectionHeader}>{title}</Text>
        )}
      />

      <StatusBar style="auto" />
    </View>
  );
}

const mealsByDay = [
  {
    title: "Saturday",
    data: [
      {
        name: "Breakfast: Pancakes",
        avatar: require('./assets/meals/pancakes.jpeg'),
      },
      {
        name: "Lunch: Pasta",
        avatar: require('./assets/meals/pasta.jpeg'),
      },
    ],
  },
  {
    title: "Sunday",
    data: [
      {
        name: "Breakfast: Eggs & Toast",
        avatar: require('./assets/meals/eggs_toast.jpeg'),
      },
      {
        name: "Dinner: Pizza",
        avatar: require('./assets/meals/pizza.jpg'),
      },
      {
        name: "Snack: Ice Cream",
        avatar: require('./assets/meals/ice_cream.jpeg'),
      },
    ],
  },
  {
    title: "Monday",
    data: [
      {
        name: "Breakfast: Oatmeal",
        avatar: require('./assets/meals/oatmeal.jpg'),
      },
      {
        name: "Lunch: Grilled Chicken",
        avatar: require('./assets/meals/grilled_chicken.jpeg'),
      },
      {
        name: "Dinner: Salmon",
        avatar: require('./assets/meals/salmon.jpeg'),
      },
    ],
  },
  {
    title: "Tuesday",
    data: [
      {
        name: "Breakfast: Pancakes",
        avatar: require('./assets/meals/pancakes.jpeg'),
      },
      {
        name: "Lunch: Pasta",
        avatar: require('./assets/meals/pasta.jpeg'),
      },
    ],
  },
  {
    title: "Wednesday",
    data: [
      {
        name: "Lunch: Rice & Veggies",
        avatar: require('./assets/meals/rice_veggies.jpeg'),
      },
      {
        name: "Dinner: Chicken Soup",
        avatar: require('./assets/meals/chicken_soup.jpeg'),
      },
    ],
  },
  {
    title: "Thursday",
    data: [
      {
        name: "Breakfast: Smoothie",
        avatar: require('./assets/meals/smoothie.jpeg'),
      },
      {
        name: "Lunch: Burger",
        avatar: require('./assets/meals/burger.jpeg'),
      }
    ],
  },
  {
    title: "Friday",
    data: [
      {
        name: "Breakfast: Eggs & Toast",
        avatar: require('./assets/meals/eggs_toast.jpeg'),
      },
      {
        name: "Dinner: Pizza",
        avatar: require('./assets/meals/pizza.jpg'),
      },
      {
        name: "Snack: Ice Cream",
        avatar: require('./assets/meals/ice_cream.jpeg'),
      },
    ],
  },
];

const styles = StyleSheet.create({
  container: {
    flex: 1,
    paddingTop: 50,
    paddingHorizontal: 16,
    backgroundColor: '#f7f7f7',
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 10,
    alignSelf: 'center',
  },
  sectionHeader: {
    fontSize: 20,
    fontWeight: 'bold',
    backgroundColor: '#e0e0e0',
    paddingVertical: 6,
    paddingHorizontal: 10,
    marginTop: 10,
    borderRadius: 5,
  },
  item: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#ffffff',
    padding: 10,
    marginVertical: 4,
    borderRadius: 8,
    elevation: 1,
  },
  avatar: {
    width: 60,
    height: 60,
    marginRight: 12,
    borderRadius: 20,
  },
  itemText: {
    fontSize: 16,
  },
});
