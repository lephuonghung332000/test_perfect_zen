// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a es locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'es';

  static String m0(min, songName) => "Cada ${min} minutos con ${songName}";

  static String m1(min) => "${min} minutos";

  static String m2(date) => "Te has suscrito a este plan desde ${date}.";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "Please_enter_theme_name": MessageLookupByLibrary.simpleMessage(
            "Por favor ingrese el nombre del temporizador"),
        "add_music_from_device": MessageLookupByLibrary.simpleMessage(
            "Agregar música desde el dispositivo"),
        "add_my_own_theme": MessageLookupByLibrary.simpleMessage(
            "Añadir mi propio temporizador"),
        "add_my_theme":
            MessageLookupByLibrary.simpleMessage("Agregar mi temporizador"),
        "ambient_sounds":
            MessageLookupByLibrary.simpleMessage("Sonidos ambientales"),
        "are_you_sure_to_permanently_delete_theme":
            MessageLookupByLibrary.simpleMessage(
                "¿Está seguro de eliminar permanentemente el temporizador?"),
        "best_value": MessageLookupByLibrary.simpleMessage("Mejor Valor"),
        "can_not_get_product_on_the_store": MessageLookupByLibrary.simpleMessage(
            "Este producto no se puede encontrar en la tienda de aplicaciones"),
        "change_language":
            MessageLookupByLibrary.simpleMessage("Cambiar Idioma"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirmar"),
        "copied": MessageLookupByLibrary.simpleMessage("Copiado"),
        "create_meditation_theme_failed": MessageLookupByLibrary.simpleMessage(
            "Error al crear el temporizador de meditación"),
        "day": MessageLookupByLibrary.simpleMessage("día"),
        "delete_confirmation":
            MessageLookupByLibrary.simpleMessage("Borrar Confirmación"),
        "delete_meditation_theme_failed": MessageLookupByLibrary.simpleMessage(
            "Falló la eliminación del temporizador de meditación"),
        "delete_theme":
            MessageLookupByLibrary.simpleMessage("Eliminar temporizador"),
        "deleted": MessageLookupByLibrary.simpleMessage("¡eliminado!"),
        "describe_plan_1": MessageLookupByLibrary.simpleMessage(
            "Tener más tetemporizadoresmas"),
        "describe_plan_2": MessageLookupByLibrary.simpleMessage(
            "Personaliza los temporizadores tú mismo"),
        "describe_plan_3":
            MessageLookupByLibrary.simpleMessage("Tener más música"),
        "describe_plan_4": MessageLookupByLibrary.simpleMessage(
            "Agrega música desde tu dispositivo"),
        "describe_plan_5":
            MessageLookupByLibrary.simpleMessage("Obtén más guías premium"),
        "describe_plan_6":
            MessageLookupByLibrary.simpleMessage("Eliminación de anuncios"),
        "discard": MessageLookupByLibrary.simpleMessage("descartar"),
        "downloading_music":
            MessageLookupByLibrary.simpleMessage("Descargar música"),
        "duration": MessageLookupByLibrary.simpleMessage("Duración"),
        "edit_meditation_theme_failed": MessageLookupByLibrary.simpleMessage(
            "Error al editar temporizador de meditación"),
        "edit_theme":
            MessageLookupByLibrary.simpleMessage("Editar temporizador"),
        "email": MessageLookupByLibrary.simpleMessage("Correo electrónico"),
        "enter_name": MessageLookupByLibrary.simpleMessage("Ingrese Nombre"),
        "every_mins": m0,
        "feedback": MessageLookupByLibrary.simpleMessage("retroalimentación"),
        "feedback_submit":
            MessageLookupByLibrary.simpleMessage("Enviar comentarios"),
        "feedback_toast": MessageLookupByLibrary.simpleMessage(
            "¡Comentarios enviados! ¡Gracias por su tiempo!"),
        "feeling_excited": MessageLookupByLibrary.simpleMessage("Emocionado"),
        "feeling_happy": MessageLookupByLibrary.simpleMessage("Feliz"),
        "feeling_message": MessageLookupByLibrary.simpleMessage(
            "¿Cómo te sientes después de la meditación?"),
        "feeling_normal": MessageLookupByLibrary.simpleMessage("Normal"),
        "feeling_sad": MessageLookupByLibrary.simpleMessage("Triste"),
        "get_error_when_get_product": MessageLookupByLibrary.simpleMessage(
            "Error de pago por producto comprado"),
        "get_list_meditation_theme_failed":
            MessageLookupByLibrary.simpleMessage(
                "Error al obtener el temporizador de meditación de la lista"),
        "get_list_music_failed": MessageLookupByLibrary.simpleMessage(
            "Error al obtener la lista de música"),
        "guide_screen":
            MessageLookupByLibrary.simpleMessage("Pantalla de guía"),
        "home": MessageLookupByLibrary.simpleMessage("Hogar"),
        "home_screen":
            MessageLookupByLibrary.simpleMessage("Pantalla de inicio"),
        "home_title": MessageLookupByLibrary.simpleMessage(
            "¿Qué temporizador se adapta a tu estado de ánimo ahora?"),
        "interval_bell":
            MessageLookupByLibrary.simpleMessage("Campana de intervalo"),
        "interval_bell_sound": MessageLookupByLibrary.simpleMessage(
            "Sonido de campana de intervalo"),
        "leave_rating": MessageLookupByLibrary.simpleMessage(
            "¡Por favor deja una calificación!"),
        "message_feedback": MessageLookupByLibrary.simpleMessage(
            "¿Tiene alguna sugerencia o encontró un error? Nos gustaría escuchar sus comentarios para mejorar nuestra aplicación."),
        "min": MessageLookupByLibrary.simpleMessage("Minutos"),
        "mins": m1,
        "most_popular": MessageLookupByLibrary.simpleMessage("Más populares"),
        "music": MessageLookupByLibrary.simpleMessage("Música"),
        "navigation_guide": MessageLookupByLibrary.simpleMessage("Guía"),
        "navigation_home": MessageLookupByLibrary.simpleMessage("Inicio"),
        "navigation_report": MessageLookupByLibrary.simpleMessage("Informe"),
        "navigation_setting":
            MessageLookupByLibrary.simpleMessage("Configuración"),
        "ok": MessageLookupByLibrary.simpleMessage("bien"),
        "order": MessageLookupByLibrary.simpleMessage("orden"),
        "paused": MessageLookupByLibrary.simpleMessage("Pausado"),
        "please_select_ambient_sounds": MessageLookupByLibrary.simpleMessage(
            "Seleccione sonidos ambientales"),
        "please_select_at_least_1_sound": MessageLookupByLibrary.simpleMessage(
            "Selecciona al menos 1 sonido"),
        "please_select_music":
            MessageLookupByLibrary.simpleMessage("Por favor selecciona música"),
        "please_select_sound":
            MessageLookupByLibrary.simpleMessage("Seleccione el sonido"),
        "premium": MessageLookupByLibrary.simpleMessage("Premium"),
        "privacy_policy":
            MessageLookupByLibrary.simpleMessage("Política de Privacidad"),
        "profile": MessageLookupByLibrary.simpleMessage("Perfil"),
        "question_mask": MessageLookupByLibrary.simpleMessage("?"),
        "rate_my_app":
            MessageLookupByLibrary.simpleMessage("¡Califica mi aplicación!"),
        "report_message_1": MessageLookupByLibrary.simpleMessage(" Tienes"),
        "report_message_2":
            MessageLookupByLibrary.simpleMessage(" ¡racha de meditación!"),
        "report_screen":
            MessageLookupByLibrary.simpleMessage("Pantalla de informe"),
        "required": MessageLookupByLibrary.simpleMessage("Requerido"),
        "restore_purchase":
            MessageLookupByLibrary.simpleMessage("Restaurar compra"),
        "review_us":
            MessageLookupByLibrary.simpleMessage("Opina sobre nosotros"),
        "save": MessageLookupByLibrary.simpleMessage("Guardar"),
        "save_10_per_3_months":
            MessageLookupByLibrary.simpleMessage("Ahorra 10% por 3 meses"),
        "save_theme":
            MessageLookupByLibrary.simpleMessage("Guardar temporizador"),
        "save_up_to_30_per_year":
            MessageLookupByLibrary.simpleMessage("Ahorra hasta un 30% por año"),
        "select_a_plan":
            MessageLookupByLibrary.simpleMessage("Seleccione un plan"),
        "select_music":
            MessageLookupByLibrary.simpleMessage("Seleccionar Música"),
        "select_sound":
            MessageLookupByLibrary.simpleMessage("Seleccionar sonido"),
        "setting_screen":
            MessageLookupByLibrary.simpleMessage("Pantalla de configuración"),
        "sound": MessageLookupByLibrary.simpleMessage("Sonido"),
        "stop_confirmation":
            MessageLookupByLibrary.simpleMessage("¿Ya no quieres meditar?"),
        "subscribed_plan": m2,
        "subscription_dialog":
            MessageLookupByLibrary.simpleMessage("Diálogo de suscripción"),
        "survey_send": MessageLookupByLibrary.simpleMessage("Enviar"),
        "survey_submit": MessageLookupByLibrary.simpleMessage("Enviar"),
        "survey_toast":
            MessageLookupByLibrary.simpleMessage("¡Gracias por tu tiempo!"),
        "term_and_privacy_message": MessageLookupByLibrary.simpleMessage(
            "Al continuar con los servicios anteriores, usted acepta"),
        "terms_of_service":
            MessageLookupByLibrary.simpleMessage("Términos del servicio"),
        "theme": MessageLookupByLibrary.simpleMessage("Temporizador"),
        "theme_name":
            MessageLookupByLibrary.simpleMessage("Nombre del temporizador"),
        "theme_name_must_be_1_30_characters":
            MessageLookupByLibrary.simpleMessage(
                "El nombre del temporizador debe tener entre 1 y 30 caracteres"),
        "thought_email":
            MessageLookupByLibrary.simpleMessage("Ingresar correo electrónico"),
        "thought_feedback": MessageLookupByLibrary.simpleMessage(
            "¡Ingresa tus comentarios aquí!"),
        "title_bullet_list": MessageLookupByLibrary.simpleMessage(
            "Ofrecemos un plan Premium con"),
        "to_access_more_meditation_guide_upgrade_your_plan":
            MessageLookupByLibrary.simpleMessage(
                "Para acceder a más guías de meditación, actualice su plan"),
        "toast_error": MessageLookupByLibrary.simpleMessage("¡Algo anda mal!"),
        "tutorial_bottom_nav_guide": MessageLookupByLibrary.simpleMessage(
            "Accede a otras funciones desde el menú"),
        "tutorial_home_and_theme_guide_1": MessageLookupByLibrary.simpleMessage(
            "Configura un temporizador con el tiempo deseado"),
        "tutorial_home_and_theme_guide_2":
            MessageLookupByLibrary.simpleMessage("sonido favorito de ti mismo"),
        "tutorial_play_botton_guide": MessageLookupByLibrary.simpleMessage(
            "Seleccione el temporizador favorito, presione el botón Reproducir para comenzar a meditar"),
        "upgrade_message": MessageLookupByLibrary.simpleMessage(
            "Para acceder a más música, actualice su plan"),
        "upgrade_now": MessageLookupByLibrary.simpleMessage("Actualizar ahora"),
        "upgrade_premium_plan":
            MessageLookupByLibrary.simpleMessage("Actualizar Plan Premium"),
        "you_have_completed_the_installation":
            MessageLookupByLibrary.simpleMessage(
                "Has completado la instalación"),
        "your_purchase_was_successful":
            MessageLookupByLibrary.simpleMessage("Tu compra fue exitosa"),
        "your_restore_purchase_was_successful":
            MessageLookupByLibrary.simpleMessage(
                "Su compra de restauración fue exitosa"),
        "your_subscribed_plan":
            MessageLookupByLibrary.simpleMessage("Tu plan suscrito")
      };
}
