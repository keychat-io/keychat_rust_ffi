use nostr::nips::nip19::{FromBech32, ToBech32};
use nostr::{
  Event, EventBuilder, EventId, JsonUtil, Keys, Kind, PublicKey, SecretKey, Tag, UnsignedEvent,
};

#[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
pub fn greet(name: String) -> String {
    format!("Hello, {name}!")
}

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}


#[flutter_rust_bridge::frb(sync)]
pub fn get_hex_pubkey_by_bech32(bech32: String) -> String {
    if !bech32.starts_with("npub") {
        return bech32;
    }
    let public_key = PublicKey::from_bech32(bech32).expect("bech32 to public key error");
    let result = public_key.to_string();
    result
}