# /// script
# requires-python = ">=3.10"
# dependencies = [
#     "pyyaml",
# ]
# ///

import yaml
import os
import sys

def load_schema(path):
    with open(path, "r") as f:
        return yaml.safe_load(f)

def save_schema(schema, path):
    with open(path, "w") as f:
        yaml.safe_dump(schema, f, sort_keys=False)

def run_scout(chapter, schema):
    print(f"Running Scout for chapter {chapter['id']}...")
    # Simulate writing research file
    os.makedirs("output", exist_ok=True)
    with open(chapter['artifacts']['research_file'], "w") as f:
        f.write(f"Research for {chapter['id']}\n")

def run_drafter(chapter, schema):
    print(f"Running Drafter for chapter {chapter['id']}...")
    draft_content = ""
    for beat in chapter.get('key_beats', []):
        print(f"  Drafting beat: {beat}")
        draft_content += f"Draft for beat: {beat}\n\n"
        
    with open(chapter['artifacts']['draft_file'], "w") as f:
        f.write(draft_content)

def run_editor(chapter, schema):
    print(f"Running Continuity Editor for chapter {chapter['id']}...")
    # Read draft
    with open(chapter['artifacts']['draft_file'], "r") as f:
        draft = f.read()
    
    # Simulate editing and splitting outputs
    with open(chapter['artifacts']['final_file'], "w") as f:
        f.write(f"Final polished text for {chapter['id']}:\n\n{draft}")
        
    with open(chapter['artifacts']['summary_file'], "w") as f:
        f.write(f"Summary of {chapter['id']}\n")

    # update ledger
    with open(schema['ledger_path'], "a") as f:
        f.write(f"\n- Rule updated from {chapter['id']}")

def main():
    schema_path = "skeleton_schema.yaml"
    if not os.path.exists(schema_path):
        print(f"Schema not found at {schema_path}")
        return

    schema = load_schema(schema_path)
    chapters = schema.get('chapters', [])
    
    for chapter in chapters:
        if chapter['status'] == 'locked':
            continue
            
        # Check prerequisites
        prereqs = chapter.get('prerequisites', [])
        prereqs_met = True
        for prereq_id in prereqs:
            prereq_chapter = next((c for c in chapters if c['id'] == prereq_id), None)
            if not prereq_chapter or prereq_chapter['status'] != 'locked':
                prereqs_met = False
                break
                
        if not prereqs_met:
            print(f"Skipping chapter {chapter['id']} because prerequisites {prereqs} are not locked.")
            continue
            
        print(f"\nProcessing chapter: {chapter['id']}")
        
        # Phase 1: Scout
        run_scout(chapter, schema)
        chapter['status'] = 'researched'
        save_schema(schema, schema_path)
        
        # Phase 2: Drafter (Beat by beat)
        run_drafter(chapter, schema)
        chapter['status'] = 'drafted'
        save_schema(schema, schema_path)
        
        # Phase 3: Editor
        run_editor(chapter, schema)
        chapter['status'] = 'locked'
        save_schema(schema, schema_path)
        
        print(f"Chapter {chapter['id']} is locked.")
        
    print("\nAll chapters processed.")

if __name__ == "__main__":
    main()
