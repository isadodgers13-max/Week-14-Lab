@PostMapping("/add")
@ResponseBody
public GuestBookEntry addEntry(@RequestBody Map<String, String> body) {
    String name = body.get("name");
    String message = body.get("message");

    GuestBookEntry entry = new GuestBookEntry();
    entry.setName(name);
    entry.setMessage(message);

    entry = repo.save(entry);   // Auto-assigns ID

    return entry;               // Returned as JSON
}
