<?php
/**
 * This file was automatically generated by the compiler on 2019-05-21 10:57:16 -- DO NOT EDIT
 */

define('COMPILATION_TIMESTAMP', '1558429036.5343');
/**
 * Data model from the delta file
 */

//
// Menus
//
class MenuCreation_application extends ModuleHandlerAPI
{
	public static function OnMenuCreation()
	{
		global $__comp_menus__; // ensure that the global variable is indeed global !
	}
} // class MenuCreation_application

/**
 * Portal(s) definition(s) extracted from the XML definition at compile time
 */
class PortalDispatcherData
{
	protected static $aData = array (
  'legacy_portal' => 
  array (
    'rank' => 1.0,
    'handler' => 'PortalDispatcher',
    'url' => 'portal/index.php',
    'allow' => 
    array (
    ),
    'deny' => 
    array (
    ),
  ),
  'backoffice' => 
  array (
    'rank' => 2.0,
    'handler' => 'PortalDispatcher',
    'url' => 'pages/UI.php',
    'allow' => 
    array (
    ),
    'deny' => 
    array (
      0 => 'Portal user',
    ),
  ),
);

	public static function GetData($sPortalId = null)
	{
		if ($sPortalId === null) return self::$aData;
		if (!array_key_exists($sPortalId, self::$aData)) return array();
		return self::$aData[$sPortalId];
	}
}

/**
 * Modules parameters extracted from the XML definition at compile time
 */
class ModulesXMLParameters
{
	protected static $aData = array (
  'itop-hub-connector' => 
  array (
    'url' => 'https://www.itophub.io',
    'route_landing' => '/my-instances/landing-from-remote',
    'route_landing_stateless' => '/stateless-remote-itop/landing-from-remote-stateless',
    'route_fetch_unread_messages' => '/api/messages',
    'route_mark_all_messages_as_read' => '/api/messages/mark-all-as-read',
    'route_view_all_messages' => '/messages',
    'setup_url' => '../pages/exec.php?exec_module=itop-hub-connector&exec_page=launch.php&target=inform_after_setup',
  ),
  'itop-portal' => 
  array (
    'lazy_loading_threshold' => '500',
  ),
  'itop-tickets' => 
  array (
    'relation_context' => 
    array (
      'UserRequest' => 
      array (
        'impacts' => 
        array (
          'down' => 
          array (
            'items' => 
            array (
              0 => 
              array (
                'oql' => 'SELECT FCI, C FROM FunctionalCI AS FCI JOIN lnkFunctionalCIToTicket AS L ON L.functionalci_id = FCI.id JOIN Change AS C ON L.ticket_id = C.id WHERE (C.outage = \'yes\') AND (C.status NOT IN (\'closed\', \'rejected\')) AND (L.impact_code != \'not_impacted\') AND (C.id != :this->id)',
                'dict' => 'Tickets:Related:OpenChanges',
                'icon' => 'itop-change-mgmt-itil/images/change-ongoing.png',
              ),
              1 => 
              array (
                'oql' => 'SELECT FCI, C FROM FunctionalCI AS FCI JOIN lnkFunctionalCIToTicket AS L ON L.functionalci_id = FCI.id JOIN Change AS C ON L.ticket_id = C.id WHERE (C.outage = \'yes\') AND (C.status NOT IN (\'closed\')) AND (L.impact_code != \'not_impacted\') AND (C.id != :this->id) AND (C.end_date < NOW() AND C.end_date > DATE_SUB(NOW(), INTERVAL 3 DAY ))',
                'dict' => 'Tickets:Related:RecentChanges',
                'icon' => 'itop-change-mgmt-itil/images/change-done.png',
              ),
              2 => 
              array (
                'oql' => 'SELECT FCI, I FROM FunctionalCI AS FCI JOIN lnkFunctionalCIToTicket AS L ON L.functionalci_id = FCI.id JOIN Incident AS I ON L.ticket_id = I.id WHERE (I.status NOT IN (\'closed\', \'resolved\')) AND (L.impact_code != \'not_impacted\') AND (I.id != :this->id)',
                'dict' => 'Tickets:Related:OpenIncidents',
                'icon' => 'itop-incident-mgmt-itil/images/incident-red.png',
                'default' => 'yes',
              ),
            ),
          ),
        ),
      ),
      'Incident' => 
      array (
        'impacts' => 
        array (
          'down' => 
          array (
            'items' => 
            array (
              0 => 
              array (
                'oql' => 'SELECT FCI, C FROM FunctionalCI AS FCI JOIN lnkFunctionalCIToTicket AS L ON L.functionalci_id = FCI.id JOIN Change AS C ON L.ticket_id = C.id WHERE (C.outage = \'yes\') AND (C.status NOT IN (\'closed\', \'rejected\')) AND (L.impact_code != \'not_impacted\') AND (C.id != :this->id)',
                'dict' => 'Tickets:Related:OpenChanges',
                'icon' => 'itop-change-mgmt-itil/images/change-ongoing.png',
              ),
              1 => 
              array (
                'oql' => 'SELECT FCI, C FROM FunctionalCI AS FCI JOIN lnkFunctionalCIToTicket AS L ON L.functionalci_id = FCI.id JOIN Change AS C ON L.ticket_id = C.id WHERE (C.outage = \'yes\') AND (C.status NOT IN (\'closed\')) AND (L.impact_code != \'not_impacted\') AND (C.id != :this->id) AND (C.end_date < NOW() AND C.end_date > DATE_SUB(NOW(), INTERVAL 3 DAY ))',
                'dict' => 'Tickets:Related:RecentChanges',
                'icon' => 'itop-change-mgmt-itil/images/change-done.png',
              ),
              2 => 
              array (
                'oql' => 'SELECT FCI, I FROM FunctionalCI AS FCI JOIN lnkFunctionalCIToTicket AS L ON L.functionalci_id = FCI.id JOIN Incident AS I ON L.ticket_id = I.id WHERE (I.status NOT IN (\'closed\', \'resolved\')) AND (L.impact_code != \'not_impacted\') AND (I.id != :this->id)',
                'dict' => 'Tickets:Related:OpenIncidents',
                'icon' => 'itop-incident-mgmt-itil/images/incident-red.png',
                'default' => 'yes',
              ),
            ),
          ),
        ),
      ),
      'Change' => 
      array (
        'impacts' => 
        array (
          'down' => 
          array (
            'items' => 
            array (
              0 => 
              array (
                'oql' => 'SELECT FCI, C FROM FunctionalCI AS FCI JOIN lnkFunctionalCIToTicket AS L ON L.functionalci_id = FCI.id JOIN Change AS C ON L.ticket_id = C.id WHERE (C.outage = \'yes\') AND (C.status NOT IN (\'closed\', \'rejected\')) AND (L.impact_code != \'not_impacted\') AND (C.id != :this->id)',
                'dict' => 'Tickets:Related:OpenChanges',
                'icon' => 'itop-change-mgmt-itil/images/change-ongoing.png',
              ),
              1 => 
              array (
                'oql' => 'SELECT FCI, C FROM FunctionalCI AS FCI JOIN lnkFunctionalCIToTicket AS L ON L.functionalci_id = FCI.id JOIN Change AS C ON L.ticket_id = C.id WHERE (C.outage = \'yes\') AND (C.status NOT IN (\'closed\')) AND (L.impact_code != \'not_impacted\') AND (C.id != :this->id) AND (C.end_date < NOW() AND C.end_date > DATE_SUB(NOW(), INTERVAL 3 DAY ))',
                'dict' => 'Tickets:Related:RecentChanges',
                'icon' => 'itop-change-mgmt-itil/images/change-done.png',
              ),
              2 => 
              array (
                'oql' => 'SELECT FCI, I FROM FunctionalCI AS FCI JOIN lnkFunctionalCIToTicket AS L ON L.functionalci_id = FCI.id JOIN Incident AS I ON L.ticket_id = I.id WHERE (I.status NOT IN (\'closed\', \'resolved\')) AND (L.impact_code != \'not_impacted\') AND (I.id != :this->id)',
                'dict' => 'Tickets:Related:OpenIncidents',
                'icon' => 'itop-incident-mgmt-itil/images/incident-red.png',
                'default' => 'yes',
              ),
            ),
          ),
        ),
      ),
    ),
  ),
  'itop-config-mgmt' => 
  array (
    'relation_context' => 
    array (
      'FunctionalCI' => 
      array (
        'impacts' => 
        array (
          'down' => 
          array (
            'items' => 
            array (
              0 => 
              array (
                'oql' => 'SELECT FCI, C FROM FunctionalCI AS FCI JOIN lnkFunctionalCIToTicket AS L ON L.functionalci_id = FCI.id JOIN Change AS C ON L.ticket_id = C.id WHERE (C.outage = \'yes\') AND (C.status NOT IN (\'closed\', \'rejected\')) AND (L.impact_code != \'not_impacted\')',
                'dict' => 'Tickets:Related:OpenChanges',
                'icon' => 'itop-change-mgmt-itil/images/change-ongoing.png',
              ),
              1 => 
              array (
                'oql' => 'SELECT FCI, C FROM FunctionalCI AS FCI JOIN lnkFunctionalCIToTicket AS L ON L.functionalci_id = FCI.id JOIN Change AS C ON L.ticket_id = C.id WHERE (C.outage = \'yes\') AND (C.status IN (\'closed\')) AND (L.impact_code != \'not_impacted\') AND (C.end_date < NOW() AND C.end_date > DATE_SUB(NOW(), INTERVAL 3 DAY ))',
                'dict' => 'Tickets:Related:RecentChanges',
                'icon' => 'itop-change-mgmt-itil/images/change-done.png',
              ),
              2 => 
              array (
                'oql' => 'SELECT FCI, I FROM FunctionalCI AS FCI JOIN lnkFunctionalCIToTicket AS L ON L.functionalci_id = FCI.id JOIN Incident AS I ON L.ticket_id = I.id WHERE (I.status NOT IN (\'closed\', \'resolved\')) AND (L.impact_code != \'not_impacted\')',
                'dict' => 'Tickets:Related:OpenIncidents',
                'icon' => 'itop-incident-mgmt-itil/images/incident-red.png',
                'default' => 'yes',
              ),
            ),
          ),
          'up' => 
          array (
            'items' => 
            array (
              0 => 
              array (
                'oql' => 'SELECT FCI, C FROM FunctionalCI AS FCI JOIN lnkFunctionalCIToTicket AS L ON L.functionalci_id = FCI.id JOIN Change AS C ON L.ticket_id = C.id WHERE (C.outage = \'yes\') AND (C.status NOT IN (\'closed\', \'rejected\')) AND (L.impact_code != \'not_impacted\')',
                'dict' => 'Tickets:Related:OpenChanges',
                'icon' => 'itop-change-mgmt-itil/images/change-ongoing.png',
              ),
              1 => 
              array (
                'oql' => 'SELECT FCI, C FROM FunctionalCI AS FCI JOIN lnkFunctionalCIToTicket AS L ON L.functionalci_id = FCI.id JOIN Change AS C ON L.ticket_id = C.id WHERE (C.outage = \'yes\') AND (C.status IN (\'closed\')) AND (L.impact_code != \'not_impacted\') AND (C.end_date < NOW() AND C.end_date > DATE_SUB(NOW(), INTERVAL 3 DAY ))',
                'dict' => 'Tickets:Related:RecentChanges',
                'icon' => 'itop-change-mgmt-itil/images/change-done.png',
              ),
              2 => 
              array (
                'oql' => 'SELECT FCI, I FROM FunctionalCI AS FCI JOIN lnkFunctionalCIToTicket AS L ON L.functionalci_id = FCI.id JOIN Incident AS I ON L.ticket_id = I.id WHERE (I.status NOT IN (\'closed\', \'resolved\')) AND (L.impact_code != \'not_impacted\')',
                'dict' => 'Tickets:Related:OpenIncidents',
                'icon' => 'itop-incident-mgmt-itil/images/incident-red.png',
                'default' => 'yes',
              ),
            ),
          ),
        ),
      ),
    ),
  ),
);

	public static function GetData($sModuleId = null)
	{
		if ($sModuleId === null) return self::$aData;
		if (!array_key_exists($sModuleId, self::$aData)) return array();
		return self::$aData[$sModuleId];
	}
}

/**
 * Relations
 */
MetaModel::RegisterRelation('impacts');
