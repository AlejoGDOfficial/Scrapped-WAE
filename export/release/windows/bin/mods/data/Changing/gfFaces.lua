function onBeatHit()
    health = getProperty('health')
    if health <= 0.5 then
        triggerEvent('Alt Idle Animation', 'gf', '0')
    end
    if health > 0.5 and health < 1.5 then
        triggerEvent('Alt Idle Animation', 'gf', '')
    end
    if health >= 1.5 then
        triggerEvent('Alt Idle Animation', 'gf', '1')
    end
end