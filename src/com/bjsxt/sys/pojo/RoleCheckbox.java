package com.bjsxt.sys.pojo;

import com.bjsxt.pojo.Role;

public class RoleCheckbox extends Role {
    private boolean checked;

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    @Override
    public String toString() {
        return "RoleCheckbox{" +
                "checked=" + checked +
                '}';
    }
}
