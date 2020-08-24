using Microsoft.AspNetCore.Http;

using System.Text.Json;



namespace Verdun.Enterprise.Inventory.Data
{
    public static class SessionExtensions
    {        
        public static void SetObjectAsJson(this ISession session, string key, object value)
        {
            session.SetString(key, JsonSerializer.Serialize(value));     //NewtonSoft.Json JsonConvert.SerializeObject(value));
        }

        public static T GetObjectFromJson<T>(this ISession session, string key)
        {
            var value = session.GetString(key);

            return value == null ? default(T) : JsonSerializer.Deserialize<T>(value);  //JsonConvert.DeserializeObject<T>(value);
        }
    }
}
