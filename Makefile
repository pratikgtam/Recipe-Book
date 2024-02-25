apk:
	flutter build apk --release
 
br:
	dart run build_runner watch --delete-conflicting-outputs

generate_feature:
	dart run scripts/generate_feature/generate_feature.dart \
		--feature=$(feature) \
		--view=$(view) \
		--cubit=$(cubit)
	dart format .
	make build_runner

# Usage example: 
#make generate_feature \
feature=profile \
view=profile \
cubit=profile	