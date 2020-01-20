/* TODO */

open ReactNative;

[@react.component]
let app = () => {
  let (contacts, setContacts) = React.useState(() => None);

  React.useEffect0(() => {
    PermissionsAndroid.(request(Permission.readContacts))
    |> Js.Promise.then_(status => {
         if (status == PermissionsAndroid.Result.granted) {
           Contacts.getAll(result => setContacts(state => Some(result)));
         } else {
           setContacts(s => Some(Error("permissions not granted")));
         };
         Js.Promise.resolve();
       });
    None;
  });

  <>
    <StatusBar barStyle=`darkContent />
    <SafeAreaView>
      <ScrollView contentInsetAdjustmentBehavior=`automatic>
        Contacts.(
          switch (contacts) {
          | Some(Ok(contact)) =>
            c
            |> Array.map(contact =>
                 <>
                   <View>
                     <Text style=styles##rowText>
                       {(
                          contact.givenName
                          ++ " "
                          ++ contact.familyName->defaultEmptyStr
                        )
                        ->React.string}
                     </Text>
                   </View>
                 </>
               )
            |> React.array
          | _ => <Text> "no contacts"->React.string </Text>
          }
        )
      </ScrollView>
    </SafeAreaView>
  </>;
};