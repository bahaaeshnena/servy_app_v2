import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:servy_app/src/features/servy/screens/chat/firebase/fire_database.dart';
import 'package:servy_app/src/features/servy/screens/chat/model/message_model.dart';
import 'package:servy_app/src/utils/constants/colors.dart';

class ChatMessageCard extends StatefulWidget {
  final int index;
  final Message messageItem;
  final String roomId;
  final bool selected;
  const ChatMessageCard({
    super.key,
    required this.index,
    required this.messageItem,
    required this.roomId,
    required this.selected,
  });

  @override
  State<ChatMessageCard> createState() => _ChatMessageCardState();
}

class _ChatMessageCardState extends State<ChatMessageCard> {
  @override
  void initState() {
    if (widget.messageItem.toId != FirebaseAuth.instance.currentUser!.uid) {
      FireData().readMessage(widget.roomId, widget.messageItem.id!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isME =
        widget.messageItem.fromId == FirebaseAuth.instance.currentUser!.uid;
    return Container(
      decoration: BoxDecoration(
          color: widget.selected ? Colors.grey : Colors.transparent,
          borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 1),
      child: Row(
        mainAxisAlignment:
            isME ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(isME ? 16 : 0),
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomRight: Radius.circular(isME ? 0 : 16),
                ),
              ),
              color: isME ? TColors.primaryColor : TColors.chatColor,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      widget.messageItem.type == 'image'
                          ? CachedNetworkImage(
                              imageUrl: widget.messageItem.msg!,
                              placeholder: (context, url) {
                                return const CircularProgressIndicator();
                              },
                            )
                          : Text(
                              widget.messageItem.msg!,
                              style: const TextStyle(color: Colors.white),
                            ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isME)
                            Icon(
                              Iconsax.tick_circle,
                              size: 18,
                              color: widget.messageItem.read == ""
                                  ? Colors.white
                                  : const Color(0xff002379),
                            ),
                          const SizedBox(width: 6),
                          Text(
                            _formatTimestamp(widget.messageItem.createdAt),
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: Colors.white70),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatTimestamp(String? timestamp) {
    if (timestamp == null || timestamp.isEmpty) {
      return 'Invalid date';
    }
    int? milliseconds = int.tryParse(timestamp);
    if (milliseconds == null) {
      return 'Invalid date';
    }
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);
    return DateFormat.yMMMEd().format(dateTime).toString();
  }
}
